/* 
 * A Viewer Object
 * Copyright © 2010, Théo de la Hogue
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTViewer.h"

#define thisTTClass			TTViewer
#define thisTTClassName		"Viewer"
#define thisTTClassTags		"viewer"

TT_MODULAR_CONSTRUCTOR,
mAddress(kTTSymEmpty),
mDescription(kTTSymEmpty),
mType(kTTSymEmpty),
mTag(kTTSymEmpty),
mSelected(YES),
mFreeze(NO),
mDataspace(kTTSym_none),
mDataspaceUnit(kTTSym_none),
mDataspaceConverter(NULL),
mDataspaceObserver(NULL),
mDataspaceUnitObserver(NULL),
mEnable(YES),
mReturnedValue(kTTValNONE),
mApplicationManager(NULL),
mReceiver(NULL),
mSender(NULL),
mReturnValueCallback(NULL)
{	
	arguments.get(0, (TTPtr*)&mApplicationManager);
	TT_ASSERT("ApplicationManager passed to TTViewer is not NULL", mApplicationManager);
	
	if(arguments.getSize() == 2)
		arguments.get(1, (TTPtr*)&mReturnValueCallback);
	
	addAttributeWithSetter(Address, kTypeSymbol);
	addAttribute(Description, kTypeSymbol);
	addAttribute(Type, kTypeSymbol);
	addAttribute(Tag, kTypeSymbol);
	addAttribute(Selected, kTypeBoolean);
	addAttributeWithSetter(Freeze, kTypeBoolean);
	
	addAttribute(Dataspace, kTypeSymbol);
	addAttributeProperty(dataspace, readOnly, YES);
	addAttributeWithSetter(DataspaceUnit, kTypeSymbol);
	
	addAttributeWithSetter(Enable, kTypeBoolean);
	
	addAttributeWithSetter(ReturnedValue, kTypeLocalValue);
	addAttributeProperty(returnedValue, readOnly, YES);
	addAttributeProperty(returnedValue, hidden, YES);
	
	addMessage(Refresh);
	
	addMessageWithArgument(Send);
	addMessageProperty(Send, hidden, YES);
	
	TTObjectInstantiate(TT("dataspace"),  &mDataspaceConverter, kTTValNONE);
}

TTViewer::~TTViewer() // TODO : delete things...
{
	if (mReturnValueCallback) {
		delete (TTValuePtr)mReturnValueCallback->getBaton();
		TTObjectRelease(TTObjectHandle(&mReturnValueCallback));
	}
	
	if (mDataspaceConverter)
		TTObjectRelease(TTObjectHandle(&mDataspaceConverter));
	
	if (mDataspaceObserver)
		TTObjectRelease(TTObjectHandle(&mDataspaceObserver));
	
	if (mDataspaceUnitObserver)
		TTObjectRelease(TTObjectHandle(&mDataspaceUnitObserver));
	
	if (mSender)
		TTObjectRelease(TTObjectHandle(&mSender));
	
	if (mReceiver)
		TTObjectRelease(TTObjectHandle(&mReceiver));
}

TTErr TTViewer::setAddress(const TTValue& value)
{
	mAddress = value;
	
	// if it binds on an attribute : refresh
	if (!bind())
		Refresh();
	
	return kTTErrNone;
}

TTErr TTViewer::bind()
{
	TTValue			args, v;
	TTObjectPtr		returnAddressCallback, returnValueCallback;
	TTValuePtr		returnAddressBaton, returnValueBaton;
	
	// Prepare arguments
	args.append(mApplicationManager);
	
	if (mAddress != kTTSymEmpty)
		args.append(mAddress);
	else
		return kTTErrGeneric;
	
	args.append(kTTSym_value);

	// Replace a TTSender object
	if (mSender)
		TTObjectRelease(TTObjectHandle(&mSender));
	
	mSender = NULL;							// without this, TTObjectInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectInstantiate(TT("Sender"), TTObjectHandle(&mSender), args);
	
	// Replace a TTReceiver object
	if (mReceiver)
		TTObjectRelease(TTObjectHandle(&mReceiver));
	
	returnAddressCallback = NULL;			// without this, TTObjectInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectInstantiate(TT("callback"), &returnAddressCallback, kTTValNONE);
	returnAddressBaton = new TTValue(TTPtr(this));
	returnAddressCallback->setAttributeValue(kTTSym_baton, TTPtr(returnAddressBaton));
	returnAddressCallback->setAttributeValue(kTTSym_function, TTPtr(&TTViewerReceiveAddressCallback));
	args.append(returnAddressCallback);
	
	returnValueCallback = NULL;				// without this, TTObjectInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectInstantiate(TT("callback"), &returnValueCallback, kTTValNONE);
	returnValueBaton = new TTValue(TTPtr(this));
	returnValueCallback->setAttributeValue(kTTSym_baton, TTPtr(returnValueBaton));
	returnValueCallback->setAttributeValue(kTTSym_function, TTPtr(&TTViewerReceiveValueCallback));
	args.append(returnValueCallback);

	mReceiver = NULL;						// without this, TTObjectInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectInstantiate(TT("Receiver"), TTObjectHandle(&mReceiver), args);
	
	observeDataspace();
	observeDataspaceUnit();
	
	return kTTErrNone;
}

TTErr TTViewer::observeDataspace()
{
	TTValue			args;
	TTObjectPtr		returnDataspaceCallback;
	TTValuePtr		returnDataspaceBaton;
	
	if (mDataspaceObserver)
		TTObjectRelease(TTObjectHandle(&mDataspaceObserver));
	
	// Make a TTReceiver object
	args.append(mApplicationManager);
	args.append(mAddress);
	args.append(kTTSym_dataspace);
	args.append(NULL);
	
	returnDataspaceCallback = NULL;				// without this, TTObjectInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectInstantiate(TT("callback"), &returnDataspaceCallback, kTTValNONE);
	returnDataspaceBaton = new TTValue(TTPtr(this));
	returnDataspaceCallback->setAttributeValue(kTTSym_baton, TTPtr(returnDataspaceBaton));
	returnDataspaceCallback->setAttributeValue(kTTSym_function, TTPtr(&TTViewerDataspaceCallback));
	args.append(returnDataspaceCallback);
	
	mDataspaceObserver = NULL;
	TTObjectInstantiate(TT("Receiver"), TTObjectHandle(&mDataspaceObserver), args);
	
	mDataspaceObserver->sendMessage(kTTSym_Get);
	
	return kTTErrNone;
}

TTErr TTViewer::observeDataspaceUnit()
{
	TTValue			args;
	TTObjectPtr		returnDataspaceUnitCallback;
	TTValuePtr		returnDataspaceUnitBaton;
	
	if (mDataspaceUnitObserver)
		TTObjectRelease(TTObjectHandle(&mDataspaceUnitObserver));
	
	// Make a TTReceiver object
	args.append(mApplicationManager);
	args.append(mAddress);
	args.append(kTTSym_dataspaceUnit);
	args.append(NULL);
	
	returnDataspaceUnitCallback = NULL;				// without this, TTObjectInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectInstantiate(TT("callback"), &returnDataspaceUnitCallback, kTTValNONE);
	returnDataspaceUnitBaton = new TTValue(TTPtr(this));
	returnDataspaceUnitCallback->setAttributeValue(kTTSym_baton, TTPtr(returnDataspaceUnitBaton));
	returnDataspaceUnitCallback->setAttributeValue(kTTSym_function, TTPtr(&TTViewerDataspaceUnitCallback));
	args.append(returnDataspaceUnitCallback);
	
	mDataspaceUnitObserver = NULL;
	TTObjectInstantiate(TT("Receiver"), TTObjectHandle(&mDataspaceUnitObserver), args);
	
	mDataspaceUnitObserver->sendMessage(kTTSym_Get);
	
	return kTTErrNone;
}

TTErr TTViewer::setEnable(const TTValue& value)
{
	mEnable = value;
	
	if (mReceiver)
		mReceiver->setAttributeValue(kTTSym_enable, mEnable);
	
	return kTTErrNone;
}

TTErr TTViewer::setFreeze(const TTValue& value)
{
	mFreeze = value;
	
	return kTTErrNone;
}

TTErr TTViewer::setReturnedValue(const TTValue& value)
{
	TTAttributePtr	anAttribute = NULL;
	TTErr			err;
	
	mReturnedValue = value;
	
	err = this->findAttribute(kTTSym_returnedValue, &anAttribute);
	
	if (!err)
		anAttribute->sendNotification(kTTSym_notify, mReturnedValue);	// we use kTTSym_notify because we know that observers are TTCallback
	
	return kTTErrNone;
}

TTErr TTViewer::Refresh()
{
	if (mReceiver)
		return mReceiver->sendMessage(kTTSym_Get);
	
	return kTTErrGeneric;
}

TTErr TTViewer::Send(TTValue& valueToSend)
{
	if (mSender) {
		
		// append view unit
		if (mDataspaceUnit != kTTSym_none)
			valueToSend.append(mDataspaceUnit);
		
		return mSender->sendMessage(kTTSym_Send, valueToSend);
	}
	
	return kTTErrGeneric;
}

TTErr TTViewer::setDataspaceUnit(const TTValue& value)
{
	TTValue n = value;				// use new value to protect the attribute
	mDataspaceUnit = value;
	
	if (mDataspaceConverter)
		mDataspaceConverter->setAttributeValue(TT("outputUnit"), mDataspaceUnit);
	
	// TODO : notifyObservers(kTTSym_dataspaceUnit, n);
	return kTTErrNone;
}

TTErr TTViewer::convertUnit(TTValue& value)
{
	if (mDataspaceConverter)
		return mDataspaceConverter->sendMessage(TT("convert"), value);
	
	return kTTErrNone;
}

#if 0
#pragma mark -
#pragma mark Some Methods
#endif

TTErr TTViewerReceiveAddressCallback(TTPtr baton, TTValue& data)
{	
	return kTTErrGeneric;
}

TTErr TTViewerReceiveValueCallback(TTPtr baton, TTValue& data)
{
	TTViewerPtr aViewer;
	TTValuePtr	b;
	TTValue		v;
	
	// unpack baton (a TTViewer)
	b = (TTValuePtr)baton;
	b->get(0, (TTPtr*)&aViewer);
	
	if (aViewer->mEnable) {
		
		if (!aViewer->mFreeze)
			// protect data
			v = data;
		else
			// use last data
			v = aViewer->mReturnedValue;
			
		aViewer->convertUnit(v);
		
		// return value
		if (aViewer->mReturnValueCallback) {
			aViewer->mReturnValueCallback->notify(v);
			aViewer->setReturnedValue(v);
		}
	}
	
	return kTTErrNone;
}

TTErr TTViewerDataspaceCallback(TTPtr baton, TTValue& data)
{
	TTViewerPtr aViewer;
	TTValuePtr	b;
	TTValue		v;
	TTErr		err;
	
	// unpack baton (a TTViewer)
	b = (TTValuePtr)baton;
	b->get(0, (TTPtr*)&aViewer);
	
	aViewer->mDataspace = data;
	
	if (aViewer->mDataspaceConverter) {
		aViewer->mDataspaceConverter->setAttributeValue(TT("dataspace"), aViewer->mDataspace);
		
		err = aViewer->mDataspaceConverter->setAttributeValue(TT("outputUnit"), aViewer->mDataspaceUnit);
		if (err) {
			aViewer->mDataspaceConverter->getAttributeValue(TT("outputUnit"), v);
			v.get(0, &aViewer->mDataspaceUnit);
			aViewer->mDataspaceConverter->setAttributeValue(TT("outputUnit"), aViewer->mDataspaceUnit);
		}
	}
	
	return kTTErrNone;
}

TTErr TTViewerDataspaceUnitCallback(TTPtr baton, TTValue& data)
{
	TTViewerPtr aViewer;
	TTValuePtr	b;
	TTValue		v;
	
	// unpack baton (a TTViewer)
	b = (TTValuePtr)baton;
	b->get(0, (TTPtr*)&aViewer);
	
	if (aViewer->mDataspaceConverter)
		aViewer->mDataspaceConverter->setAttributeValue(TT("inputUnit"), data);
	
	return kTTErrNone;
}