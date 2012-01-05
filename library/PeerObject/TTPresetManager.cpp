/* 
 * A TTPresetManager Object
 * Copyright © 2010, Théo de la Hogue
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTPresetManager.h"

#define thisTTClass			TTPresetManager
#define thisTTClassName		"PresetManager"
#define thisTTClassTags		"preset, manager"

TT_MODULAR_CONSTRUCTOR,
mAddress(kTTAdrsEmpty),
mNames(kTTValNONE),
mCurrent(kTTValNONE),
mPrevious(kTTValNONE),
mNext(kTTValNONE),
mPresetArguments(kTTValNONE),
mPresetList(NULL),
mCurrentIndex(0)
{
	TTValue v;
	
	mPresetArguments = arguments;
	mPresetArguments.append((TTPtr)this);	// append the preset manager object as argument
	
	addAttributeWithSetter(Address, kTypeSymbol);
	
	addAttributeWithGetter(Names, kTypeLocalValue);
	addAttributeProperty(Names, readOnly, YES);
	
	addAttributeWithGetter(Current, kTypeLocalValue);
	addAttributeProperty(Current, readOnly, YES);
	
	addAttributeWithGetter(Previous, kTypeLocalValue);
	addAttributeProperty(Previous, readOnly, YES);
	
	addAttributeWithGetter(Next, kTypeLocalValue);
	addAttributeProperty(Next, readOnly, YES);
	
	addMessage(New);
	
	addMessageWithArguments(Store);
	addMessage(StoreCurrent);
	addMessageWithArguments(StoreNext);
	addMessageWithArguments(StorePrevious);

	addMessageWithArguments(Recall);
	addMessage(RecallCurrent);
	addMessage(RecallNext);
	addMessage(RecallPrevious);
	
	addMessageWithArguments(Remove);
	addMessage(RemoveCurrent);
	addMessage(RemoveNext);
	addMessage(RemovePrevious);

	// needed to be handled by a TTXmlHandler
	addMessageWithArguments(WriteAsXml);
	addMessageProperty(WriteAsXml, hidden, YES);
	
	addMessageWithArguments(ReadFromXml);
	addMessageProperty(ReadFromXml, hidden, YES);
	
	mPresetList = new TTList();
}

TTPresetManager::~TTPresetManager()
{
	TTPresetPtr oldPreset;
	TTCallbackPtr oldCallback = NULL;
	
	for (mPresetList->begin(); mPresetList->end(); mPresetList->next()) {
		mPresetList->current().get(0, (TTPtr*)&oldPreset);
		TTObjectRelease(TTObjectHandle(&oldPreset));
	}
	
	delete mPresetList;
	mPresetList = NULL;
	
	mPresetArguments.get(0, (TTPtr*)&oldCallback);
	if (oldCallback) {
		delete (TTValuePtr)oldCallback->getBaton();
		TTObjectRelease(TTObjectHandle(&oldCallback));
	}
	
	mPresetArguments.get(1, (TTPtr*)&oldCallback);
	if (oldCallback) {
		delete (TTValuePtr)oldCallback->getBaton();
		TTObjectRelease(TTObjectHandle(&oldCallback));
	}
	
	mPresetArguments.get(2, (TTPtr*)&oldCallback);
	if (oldCallback) {
		delete (TTValuePtr)oldCallback->getBaton();
		TTObjectRelease(TTObjectHandle(&oldCallback));
	}
	
	mPresetArguments.get(3, (TTPtr*)&oldCallback);
	if (oldCallback) {
		delete (TTValuePtr)oldCallback->getBaton();
		TTObjectRelease(TTObjectHandle(&oldCallback));
	}
	
	mPresetArguments.get(4, (TTPtr*)&oldCallback);
	if (oldCallback) {
		delete (TTValuePtr)oldCallback->getBaton();
		TTObjectRelease(TTObjectHandle(&oldCallback));
	}
}

TTErr TTPresetManager::getNames(TTValue& value)
{	
	TTPresetPtr aPreset;
	
	if (mPresetList->isEmpty())
		value = kTTSymEmpty;
	else
		for (mPresetList->begin(); mPresetList->end(); mPresetList->next()) {
			mPresetList->current().get(0, (TTPtr*)&aPreset);
			value.append(aPreset->mName);
		}
	
	return kTTErrNone;
}

TTErr TTPresetManager::getCurrent(TTValue& value)
{	
	TTPresetPtr aPreset;
	
	aPreset = getPresetCurrent();
	
	if (aPreset) {
		value.append(mCurrentIndex);
		value.append(aPreset->mName);
		value.append(aPreset->mComment);
	}
	
	return kTTErrNone;
}

TTErr TTPresetManager::getPrevious(TTValue& value)
{	
	TTPresetPtr previousPreset;
	
	mCurrentIndex--;
	previousPreset = getPresetCurrent();
	
	if (previousPreset) {
		value.append(mCurrentIndex);
		value.append(previousPreset->mName);
		value.append(previousPreset->mComment);
	}
	
	mCurrentIndex++;
	
	return kTTErrNone;
}

TTErr TTPresetManager::getNext(TTValue& value)
{	
	TTPresetPtr nextPreset;
	
	mCurrentIndex++;
	nextPreset = getPresetCurrent();
	
	if (nextPreset) {
		value.append(mCurrentIndex);
		value.append(nextPreset->mName);
		value.append(nextPreset->mComment);
	}
	
	mCurrentIndex--;
	
	return kTTErrNone;
}

TTErr TTPresetManager::setAddress(const TTValue& value)
{	
	New();
	
	value.get(0, &mAddress);
	
	return kTTErrNone;
}

TTErr TTPresetManager::New()
{
	TTPresetPtr oldPreset;
	
	for (mPresetList->begin(); mPresetList->end(); mPresetList->next()) {
		mPresetList->current().get(0, (TTPtr*)&oldPreset);
		TTObjectRelease(TTObjectHandle(&oldPreset));
	}
	
	delete mPresetList;
	mPresetList = NULL;
	mPresetList = new TTList();
	mCurrentIndex = 0;
	
	// notify observers of the preset list
	notifyNamesObservers();
	
	return kTTErrNone;
}

TTErr TTPresetManager::Store(const TTValue& inputValue, TTValue& outputValue)
{
	TTUInt8		index;
	TTSymbolPtr	presetName = kTTSymEmpty;
	TTPresetPtr	newPreset = NULL;
	TTValue		args;
	
	// First arg : index
	if (inputValue.getType(0) == kTypeInt32) {
		inputValue.get(0, index);
		if (index < 1)
			return kTTErrGeneric;
	}
	else
		return kTTErrGeneric;
	
	// Second arg : preset name
	if (inputValue.getType(1) == kTypeSymbol) {
		inputValue.get(1, &presetName);
		if (presetName == kTTSymEmpty)
			return kTTErrGeneric;
	}
	else
		return kTTErrGeneric;
	
	// Create a new preset
	TTObjectInstantiate(TT("Preset"), TTObjectHandle(&newPreset), mPresetArguments);
	
	newPreset->setAttributeValue(kTTSym_address, mAddress);
	newPreset->setAttributeValue(kTTSym_name, presetName);
	
	newPreset->sendMessage(kTTSym_Fill);
	
	// Insert at index
	mCurrentIndex = index;
	mPresetList->insert(mCurrentIndex-1, (TTPtr)newPreset);		// -1 because user starts at 1 and TTList starts at 0
	
	// notify observers of the preset list
	notifyNamesObservers();
	
	return kTTErrNone;
}

TTErr TTPresetManager::StoreCurrent()
{
	TTPresetPtr currentPreset;
	
	currentPreset = getPresetCurrent();
	if (!currentPreset)
		return kTTErrGeneric;
	
	currentPreset->sendMessage(TT("Clear"));
	currentPreset->sendMessage(kTTSym_Fill);
	
	// notify observers of the preset list
	notifyNamesObservers();
	
	return kTTErrNone;
}

TTErr TTPresetManager::StoreNext(const TTValue& inputValue, TTValue& outputValue)
{
	TTSymbolPtr	presetName = kTTSymEmpty;
	TTPresetPtr	newPreset = NULL;
	TTValue		args;
	
	// First arg : preset name
	if (inputValue.getType() == kTypeSymbol) {
		inputValue.get(0, &presetName);
		if (presetName == kTTSymEmpty)
			return kTTErrGeneric;
	}
	else
		return kTTErrGeneric;
	
	// Create a new preset
	TTObjectInstantiate(TT("Preset"), TTObjectHandle(&newPreset), mPresetArguments);
	
	newPreset->setAttributeValue(kTTSym_address, mAddress);
	newPreset->setAttributeValue(kTTSym_name, presetName);
	
	newPreset->sendMessage(kTTSym_Fill);
	
	// Insert AFTER current
	mCurrentIndex++;
	mPresetList->insert(mCurrentIndex-1, (TTPtr)newPreset);		// -1 because user starts at 1 and TTList starts at 0
	
	// notify observers of the preset list
	notifyNamesObservers();
	
	return kTTErrNone;
}

TTErr TTPresetManager::StorePrevious(const TTValue& inputValue, TTValue& outputValue)
{
	TTSymbolPtr	presetName = kTTSymEmpty;
	TTPresetPtr	newPreset = NULL;
	TTValue		args;
	
	// First arg : preset name
	if (inputValue.getType() == kTypeSymbol) {
		inputValue.get(0, &presetName);
		if (presetName == kTTSymEmpty)
			return kTTErrGeneric;
	}
	else
		return kTTErrGeneric;
	
	// Create a new preset
	TTObjectInstantiate(TT("Preset"), TTObjectHandle(&newPreset), mPresetArguments);
	
	newPreset->setAttributeValue(kTTSym_address, mAddress);
	newPreset->setAttributeValue(kTTSym_name, presetName);
	
	newPreset->sendMessage(kTTSym_Fill);
	
	// Insert BEFORE current
	mCurrentIndex--;
	if (mCurrentIndex < 1) 
		mCurrentIndex = 1;
	mPresetList->insert(mCurrentIndex-1, (TTPtr)newPreset);		// -1 because user starts at 1 and TTList starts at 0
	
	// notify observers of the preset list
	notifyNamesObservers();
	
	return kTTErrNone;
}

TTErr TTPresetManager::Recall(const TTValue& inputValue, TTValue& outputValue)
{
	TTUInt8		index;
	TTSymbolPtr	presetName = kTTSymEmpty;
	TTPresetPtr currentPreset;
	
	// First arg could be an index
	if (inputValue.getType() == kTypeInt32) {
		inputValue.get(0, index);
		if (index == 0)
			return kTTErrGeneric;
		
		mCurrentIndex = index;
		currentPreset = getPresetCurrent();
	}
	// or a preset name
	else if (inputValue.getType() == kTypeSymbol) {
		inputValue.get(0, &presetName);
		if (presetName == kTTSymEmpty)
			return kTTErrGeneric;
		
		currentPreset = getPresetWithName(presetName);
	}
	else
		return kTTErrGeneric;
	
	// Is the asked preset exists
	if (!currentPreset)
		return kTTErrGeneric;
	
	currentPreset->sendMessage(kTTSym_Send);
	
	return kTTErrNone;
}

TTErr TTPresetManager::RecallCurrent()
{
	TTPresetPtr currentPreset;
	
	currentPreset = getPresetCurrent();
	if (!currentPreset)
		return kTTErrGeneric;
	
	currentPreset->sendMessage(kTTSym_Send);
	
	return kTTErrNone;
}

TTErr TTPresetManager::RecallNext()
{
	TTPresetPtr nextPreset;
	
	mCurrentIndex++;
	nextPreset = getPresetCurrent();
	if (!nextPreset)
		return kTTErrGeneric;
		
	nextPreset->sendMessage(kTTSym_Send);
			
	return kTTErrNone;
}

TTErr TTPresetManager::RecallPrevious()
{
	TTPresetPtr previousPreset;
	
	mCurrentIndex--;
	previousPreset = getPresetCurrent();
	if (!previousPreset)
		return kTTErrGeneric;
	
	previousPreset->sendMessage(kTTSym_Send);
	
	return kTTErrNone;
}

TTErr TTPresetManager::Remove(const TTValue& inputValue, TTValue& outputValue)
{
	TTUInt8		index;
	TTSymbolPtr	presetName = kTTSymEmpty;
	TTPresetPtr currentPreset;
	
	// First arg could be an index
	if (inputValue.getType() == kTypeInt32) {
		inputValue.get(0, index);
		if (index == 0)
			return kTTErrGeneric;
		
		mCurrentIndex = index;
		currentPreset = getPresetCurrent();
	}
	// or a preset name
	else if (inputValue.getType() == kTypeSymbol) {
		inputValue.get(0, &presetName);
		if (presetName == kTTSymEmpty)
			return kTTErrGeneric;
		
		currentPreset = getPresetWithName(presetName);
	}
	else
		return kTTErrGeneric;
	
	// Is the asked preset exists
	if (!currentPreset)
		return kTTErrGeneric;
	
	mPresetList->remove(TTValue((TTPtr)currentPreset));
	TTObjectRelease(TTObjectHandle(&currentPreset));
	
	// notify observers of the preset list
	notifyNamesObservers();
	
	return kTTErrNone;
}

TTErr TTPresetManager::RemoveCurrent()
{
	TTPresetPtr currentPreset;
	
	currentPreset = getPresetCurrent();
	if (!currentPreset)
		return kTTErrGeneric;
	
	mPresetList->remove(TTValue((TTPtr)currentPreset));
	TTObjectRelease(TTObjectHandle(&currentPreset));
	
	// notify observers of the preset list
	notifyNamesObservers();
	
	return kTTErrNone;
}

TTErr TTPresetManager::RemoveNext()
{
	TTPresetPtr nextPreset;
	
	mCurrentIndex++;
	nextPreset = getPresetCurrent();
	if (!nextPreset)
		return kTTErrGeneric;
	
	mPresetList->remove(TTValue((TTPtr)nextPreset));
	TTObjectRelease(TTObjectHandle(&nextPreset));
	
	// notify observers of the preset list
	notifyNamesObservers();
	
	return kTTErrNone;
}

TTErr TTPresetManager::RemovePrevious()
{
	TTPresetPtr previousPreset;
	
	mCurrentIndex--;
	previousPreset = getPresetCurrent();
	if (!previousPreset)
		return kTTErrGeneric;
	
	mPresetList->remove(TTValue((TTPtr)previousPreset));
	TTObjectRelease(TTObjectHandle(&previousPreset));
	
	// notify observers of the preset list
	notifyNamesObservers();
	
	return kTTErrNone;
}

TTErr TTPresetManager::WriteAsXml(const TTValue& inputValue, TTValue& outputValue)
{
	TTXmlHandlerPtr		aXmlHandler;
	TTPresetPtr			aPreset;
    TTValue				v;
	TTUInt8				i;
	
	inputValue.get(0, (TTPtr*)&aXmlHandler);
	
    xmlTextWriterWriteComment(aXmlHandler->mWriter, BAD_CAST "TODO : TTContainer Description at mAddress");
	
	// Check if current preset exists
	i = 1;
	for (mPresetList->begin(); mPresetList->end(); mPresetList->next()) {
		
		xmlTextWriterStartElement(aXmlHandler->mWriter, BAD_CAST "preset");
		xmlTextWriterWriteFormatAttribute(aXmlHandler->mWriter, BAD_CAST "number", "%ld", BAD_CAST i);

		mPresetList->current().get(0, (TTPtr*)&aPreset);
		
		v = TTValue(TTPtr(aPreset));
		aXmlHandler->setAttributeValue(kTTSym_object, v);
		aXmlHandler->sendMessage(TT("Write"));
		
		// End a preset
		xmlTextWriterEndElement(aXmlHandler->mWriter);
		
		i++;
	}
    	
	return kTTErrNone;
}

TTErr TTPresetManager::ReadFromXml(const TTValue& inputValue, TTValue& outputValue)
{
	TTXmlHandlerPtr	aXmlHandler = NULL;	
	TTSymbolPtr		presetName;
	TTUInt8			presetNumber;
	TTPresetPtr		newPreset, currentPreset;
	TTValue			v, args;
	
	inputValue.get(0, (TTPtr*)&aXmlHandler);
	if (!aXmlHandler)
		return kTTErrGeneric;
	
	// Switch on the name of the XML node
	
	// Starts reading
	if (aXmlHandler->mXmlNodeName == TT("start")) {
		New();
		return kTTErrNone;
	}
	
	// Ends reading
	if (aXmlHandler->mXmlNodeName == TT("end")) {
		mCurrentIndex = 1;
		
		// notify observers of the preset list
		notifyNamesObservers();
		
		return kTTErrNone;
	}
	
	// Comment Node
	if (aXmlHandler->mXmlNodeName == TT("#comment"))
		return kTTErrNone;

	// Preset node
	if (aXmlHandler->mXmlNodeName == TT("preset")) {
		
		currentPreset = getPresetCurrent();
		presetName = kTTSymEmpty;
		presetNumber = 0;
		
		// get number
		if (xmlTextReaderMoveToAttribute(aXmlHandler->mReader, BAD_CAST "number") == 1) {
			aXmlHandler->fromXmlChar(xmlTextReaderValue(aXmlHandler->mReader), v);
			if (v.getType() == kTypeInt32)
				v.get(0, presetNumber);
		}
		
		// get name
		if (xmlTextReaderMoveToAttribute(aXmlHandler->mReader, BAD_CAST "name") == 1) {
			aXmlHandler->fromXmlChar(xmlTextReaderValue(aXmlHandler->mReader), v, true);
			if (v.getType() == kTypeSymbol)
				v.get(0, &presetName);
		}
		
		// Is it the beginning of a new preset or the end of one ?
		if (currentPreset)
			if (presetName == currentPreset->mName && presetNumber == mCurrentIndex)
				return kTTErrNone;
		
		// Create a new preset
		newPreset = NULL;
		TTObjectInstantiate(TT("Preset"), TTObjectHandle(&newPreset), mPresetArguments);
		
		newPreset->setAttributeValue(kTTSym_address, mAddress);
		newPreset->setAttributeValue(kTTSym_name, presetName);
		
		mPresetList->append((TTPtr)newPreset);
		
		mCurrentIndex++;
		
		return kTTErrNone;
	}
	
	// if there is a current preset
	currentPreset = getPresetCurrent();
	if (!currentPreset)
		return kTTErrGeneric;
	
	// fill the current preset by reading his content 
	// from the xml file using the XmlHandler
	v = TTValue(TTPtr(currentPreset));
	aXmlHandler->setAttributeValue(kTTSym_object, v);
	return aXmlHandler->sendMessage(TT("Read"));
}

TTErr TTPresetManager::WriteAsText(const TTValue& inputValue, TTValue& outputValue)
{
	TTTextHandlerPtr aTextHandler;
	ofstream		*file;
	
	inputValue.get(0, (TTPtr*)&aTextHandler);
	file = aTextHandler->mWriter;
	
	*file << "TTPresetManager::WriteAsText -- TODO";
	
	return kTTErrNone;
}

TTErr TTPresetManager::ReadFromText(const TTValue& inputValue, TTValue& outputValue)
{
	TTTextHandlerPtr aTextHandler;
	ifstream		*file;
	
	inputValue.get(0, (TTPtr*)&aTextHandler);
	file = aTextHandler->mReader;
	
	// TODO
	
	return kTTErrNone;
}

TTPresetPtr TTPresetManager::getPresetCurrent()
{
	TTPresetPtr	aPreset;
	TTUInt8		i;
	
	// Note : user starts at 1 and TTList starts at 0
	
	if (mPresetList->isEmpty()) {
		mCurrentIndex = 0;
		return NULL;
	}
	
	// if there are presets but no current
	// always set the current on the first
	if (mCurrentIndex < 1) {
		mCurrentIndex = 1;
		return NULL;
	}
	
	// if the current index is higher 
	if (mCurrentIndex > mPresetList->getSize()) {
		mCurrentIndex = mPresetList->getSize();
		return NULL;
	}
	
	i = 1;
	for (mPresetList->begin(); mPresetList->end(); mPresetList->next()) {
		
		mPresetList->current().get(0, (TTPtr*)&aPreset);
		
		if (i == mCurrentIndex)
			break;

		i++;
	}
	
	mCurrentIndex = i;
	return aPreset;
}

TTPresetPtr TTPresetManager::getPresetWithName(TTSymbolPtr name)
{
	TTPresetPtr	aPreset;
	TTValue		v;
	TTSymbolPtr n;
	TTUInt8		i;
	TTBoolean	found;
	
	if (mPresetList->isEmpty()) {
		mCurrentIndex = 0;
		return NULL;
	}
	
	i = 1;
	found = false;
	for (mPresetList->begin(); mPresetList->end(); mPresetList->next()) {

			mPresetList->current().get(0, (TTPtr*)&aPreset);
			
			aPreset->getAttributeValue(kTTSym_name, v);
			v.get(0, &n);
			if (n == name) {
				found = true;
				break;
			}
			
			i++;
		}
	
	if (found) {
		mCurrentIndex = i;
		return aPreset;
	}
	else {
		mCurrentIndex = 0;
		return NULL;
	}
}

TTErr TTPresetManager::notifyNamesObservers()
{
	TTValue v;
	TTAttributePtr	anAttribute = NULL;
	TTErr			err;
	
	err = this->findAttribute(TT("names"), &anAttribute);
	
	if (!err) {
		getNames(v);
		anAttribute->sendNotification(kTTSym_notify, v);	// we use kTTSym_notify because we know that observers are TTCallback
	}
	
	return kTTErrNone;
}

#if 0
#pragma mark -
#pragma mark Some Methods
#endif
