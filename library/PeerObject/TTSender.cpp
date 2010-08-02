/* 
 * A Sender Object
 * Copyright © 2010, Théo de la Hogue
 * 
 * License: This code is licensed under the terms of the GNU LGPL
 * http://www.gnu.org/licenses/lgpl.html 
 */

#include "TTSender.h"

#define thisTTClass			TTSender
#define thisTTClassName		"Sender"
#define thisTTClassTags		"node, sender"

TT_MODULAR_CONSTRUCTOR,
mDirectory(NULL),
mAddress(kTTSymEmpty),
mAttribute(kTTSym_value),
mObjectCache(NULL),
mObserver(NULL)
{
	TT_ASSERT("Correct number of args to create TTSender", arguments.getSize() == 3);
		
	arguments.get(0, (TTPtr*)&mDirectory);
	TT_ASSERT("Directory passed to TTSender is not NULL", mDirectory);
	arguments.get(1, &mAddress);
	arguments.get(2, &mAttribute);

	addAttributeWithSetter(Address, kTypeSymbol);
	addAttributeWithSetter(Attribute, kTypeSymbol);
	
	addMessageWithArgument(send);
	
	mIsSending = false;
	
	if (mDirectory)
		bind();
}

TTSender::~TTSender()
{
	unbind();
}

TTErr TTSender::setAddress(const TTValue& newValue)
{
	unbind();
	mAddress = newValue;
	return bind();
}

TTErr TTSender::setAttribute(const TTValue& newValue)
{
	mAttribute = newValue;
	
	if (mAttribute == NO_ATTRIBUTE)
		mAttribute = kTTSym_value;
	
	return kTTErrNone;
}

#if 0
#pragma mark -
#pragma mark Some Methods
#endif

TTErr TTSender::send(TTValue& valueToSend)
{
	TTObjectPtr		anObject;
	TTValue			aCacheElement;

	if (!mIsSending) {
		
		// lock
		mIsSending = true;
		
		if (!mObjectCache->isEmpty()) {
			
			// send data to each node of the selection
			for (mObjectCache->begin(); mObjectCache->end(); mObjectCache->next()) {
				
				aCacheElement = mObjectCache->current();
								
				// then his object
				aCacheElement.get(0, (TTPtr*)&anObject);
				
				if (mAttribute == kTTSym_Value)
					// set the value attribute using a command
					anObject->sendMessage(kTTSym_command, valueToSend);
				else
					// set the attribute of the object
					anObject->setAttributeValue(mAttribute, valueToSend);
			}
		}
		
		// unlock
		mIsSending = false;	
	}
	
	return kTTErrNone;
}

TTErr TTSender::bind()
{
	TTNodePtr	aNode;
	TTObjectPtr	anObject;
	TTValuePtr	newBaton, aCacheElement;
	TTList		aNodeList;
	TTValue		v;
	TTErr		err;
	
	// 1. Look for the node(s) into the directory
	err = mDirectory->Lookup(mAddress, aNodeList, &aNode);
	
	// 2. make a cache containing each object
	mObjectCache  = new TTList();
	
	for (aNodeList.begin(); aNodeList.end(); aNodeList.next()) {
		
		aNodeList.current().get(0, (TTPtr*)&aNode);
		aNode->getAttributeValue(kTTSym_Object, v);
		v.get(0, (TTPtr*)&anObject);
		
		aCacheElement = new TTValue((TTPtr)anObject);
		
		mObjectCache->append(aCacheElement);
	}
	
	// 3. Observe any creation or destruction below the address
	mObserver = NULL; // without this, TTObjectInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectInstantiate(TT("Callback"), &mObserver, kTTValNONE);
	
	newBaton = new TTValue(TTPtr(this));
	newBaton->append(TTPtr(kTTSymEmpty));
	
	mObserver->setAttributeValue(TT("Baton"), TTPtr(newBaton));
	mObserver->setAttributeValue(TT("Function"), TTPtr(&TTSenderDirectoryCallback));
	
	mObserver->setAttributeValue(TT("Owner"), TT("TTSender"));		// this is usefull only to debug
	
	mDirectory->addObserverForNotifications(mAddress, *mObserver);
	
	return kTTErrNone;
}

TTErr TTSender::unbind()
{
	TTErr		err = kTTErrNone;	
	
	if (mObjectCache)
		delete mObjectCache;
		mObjectCache = NULL;
	
	// stop life cycle observation
	if(mObserver && mDirectory) {
		
		err = mDirectory->removeObserverForNotifications(mAddress, *mObserver);
	
		if(!err)
			TTObjectRelease(&mObserver);
	}
	
	return kTTErrNone;
}

TTErr TTSenderDirectoryCallback(TTPtr baton, TTValue& data)
{
	TTValuePtr		b, aCacheElement;
	TTSenderPtr		aSender;
	TTNodePtr		aNode, aCacheObject;
	TTObjectPtr		anObject;
	TTSymbolPtr		anAddress;
	TTValue			v;
	TTUInt8			flag;

	// unpack baton (a TTSenderPtr)
	b = (TTValuePtr)baton;
	b->get(0, (TTPtr*)&aSender);

	// Unpack data (oscAddress, aNode, flag, anObserver)
	data.get(0, &anAddress);
	data.get(1, (TTPtr*)&aNode);
	data.get(2, flag);
	
	switch (flag) {
			
		case kAddressCreated :
		{
			aNode->getAttributeValue(kTTSym_Object, v);
			v.get(0, (TTPtr*)&anObject);
			
			aCacheElement = new TTValue((TTPtr)anObject);
			
			aSender->mObjectCache->appendUnique(aCacheElement);
			break;
		}
			
		case kAddressDestroyed :
		{
			aNode->getAttributeValue(kTTSym_Object, v);
			v.get(0, (TTPtr*)&anObject);
			
			// find the object in the cache and remove it
			for (aSender->mObjectCache->begin(); aSender->mObjectCache->end(); aSender->mObjectCache->next()) {
				
				// get a node
				aSender->mObjectCache->current().get(0,(TTPtr*)&aCacheObject);
				
				if (aCacheObject == anObject) {
					aSender->mObjectCache->remove(aSender->mObjectCache->current());
					break;
				}
			}
			break;
		}
			
		default:
			break;
	}
	
	return kTTErrNone;
}
