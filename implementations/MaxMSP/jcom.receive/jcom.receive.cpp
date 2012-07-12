/* 
 *	jcom.receive
 *	External object
 *	Copyright © 2010 by Théo de la Hogue
 * 
 * License: This code is licensed under the terms of the GNU LGPL
 * http://www.gnu.org/licenses/lgpl.html 
 */

#include "TTModularClassWrapperMax.h"

#define data_out 0
#define address_out 1
#define dump_out 2

// Definitions

/** Wrap the jcom.receive class as a Max object.
 @param c			The class to be wrapped
 @see				WrappedReceiverClass_new, WrappedReceiverClass_free
 */
void		WrapTTReceiverClass(WrappedClassPtr c);

/** Wrapper for the jcom.receive constructor class, called when an instance is created. 
 @param self		Pointer to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				WrappedReceiverClass_free, receive_subscribe
 */
void		WrappedReceiverClass_new(TTPtr self, AtomCount argc, AtomPtr argv);

/** Wrapper for the jcom.receive deconstructor class, called when an instance is destroyed. 
 @param self		Pointer to this object.
 @see				WrappedReceiverClass_new
 */
void		WrappedReceiverClass_free(TTPtr self);

/** Assistance Method. 
 @param self		Pointer to this object.
 @param b			Pointer to (exactly what?)
 @param msg			The message passed to the object.
 @param arg			
 @param dst			Pointer to the destination that assistance strings are passed to for display.
 */
void		receive_assist(TTPtr self, void *b, long msg, long arg, char *dst);

/** Associate jcom.receive(~) with NodeLib. This is a prerequisit for communication with other Jamoma object in the module and beyond.  */
void		receive_subscribe(TTPtr self);

void		receive_return_model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

#ifdef JCOM_RECEIVE_TILDE

/** jcom.receive~ 32-bit MSP perform method (for Max 5). Only defined for jcom.receive~. */
t_int*		receive_perform(t_int *w);

/** jcom.receive~ 32-bit DSP method (for Max 5).Only defined for jcom.receive~. */
void		receive_dsp(TTPtr self, t_signal **sp, short *count);

/** jcom.receive~ 64-bit MSP perform method (for Max 6). Only defined for jcom.receive~. */
void		receive_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);

/** jcom.receive~ 64-bit DSP method (for Max 6). Only defined for jcom.receive~. */
void		receive_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);

#else

void		receive_return_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		receive_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** bang handler for jcom.receive 
 @param self		Pointer to this object.
 @see				receive_int, receive_float, receive_list, WrappedOutputClass_anything
 */
void		receive_bang(TTPtr self);

#endif

/** set message handler for jcom.receive. To change the address to bind.
 @param self		Pointer to this object.
 @param address		The address to bind
 @see				receive_subscribe
 */
void		receive_set(TTPtr self, SymbolPtr address);

#pragma mark -
#pragma mark main

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTReceiverClass;
	spec->_new = &WrappedReceiverClass_new;
	spec->_free = &WrappedReceiverClass_free;
	spec->_any = NULL;
	
#ifdef JCOM_RECEIVE_TILDE
	return wrapTTModularClassAsMaxClass(TT("Receiver"), "jcom.receive~", NULL, spec);
#else
	return wrapTTModularClassAsMaxClass(TT("Receiver"), "jcom.receive", NULL, spec);
#endif
	
}

void WrapTTReceiverClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)receive_assist,				"assist",				A_CANT, 0L);
	
	class_addmethod(c->maxClass, (method)receive_return_model_address,	"return_model_address",	A_CANT, 0);

#ifdef JCOM_RECEIVE_TILDE
	class_addmethod(c->maxClass, (method)receive_dsp,					"dsp", 					A_GIMME, 0L);
	class_addmethod(c->maxClass, (method)receive_dsp64,					"dsp64",				A_CANT, 0);
#else
	class_addmethod(c->maxClass, (method)receive_return_address,		"return_address",		A_CANT, 0);
	class_addmethod(c->maxClass, (method)receive_return_value,			"return_value",			A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)receive_bang,					"bang",					0);
#endif
	
	class_addmethod(c->maxClass, (method)receive_set,					"set",					A_SYM, 0);
	
#ifdef JCOM_RECEIVE_TILDE
	// Setup our class to work with MSP
	class_dspinit(c->maxClass);
#endif
}

#pragma mark -
#pragma mark Object life

void WrappedReceiverClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	SymbolPtr					address;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
	
	// read first argument
	if (attrstart && argv) 
		address = atom_getsym(argv);
	else
		address = _sym_nothing;
	
	x->address = TTADRS(jamoma_parse_dieze((ObjectPtr)x, address)->s_name);
	x->argc = 0; // the argc member is usefull to count how many time the external tries to bind
	
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 2);
		
#ifdef JCOM_RECEIVE_TILDE
		jamoma_receiver_create_audio((ObjectPtr)x, &x->wrappedObject);
		
		dsp_setup((t_pxobject *)x, 1);	
		x->obj.z_misc = Z_NO_INPLACE | Z_PUT_FIRST;
		
		x->outlets[address_out] = outlet_new(x, NULL);					// anything outlet to output address
		x->outlets[data_out] = outlet_new((t_pxobject *)x, "signal");	// signal outlet to output audio
#else
		jamoma_receiver_create((ObjectPtr)x, &x->wrappedObject);
		
		x->outlets[address_out] = outlet_new(x, NULL);					// anything outlet to output address
		x->outlets[data_out] = outlet_new(x, NULL);						// anything outlet to output data
#endif
	
	// Prepare memory to store internal objects
	x->internals = new TTHash();

	// handle attribute args
	attr_args_process(x, argc, argv);
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)receive_subscribe, NULL, 0, 0);
}

void WrappedReceiverClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
#ifdef JCOM_RECEIVE_TILDE
	if (x->address->getName() == TT("out"))
		dsp_free((t_pxobject *)x);				// Always call dsp_free first in this routine
#endif
}

#pragma mark -
#pragma mark NodeLib association

void receive_subscribe(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue						v;
	TTNodeAddressPtr			contextAddress = kTTAdrsEmpty;
	TTNodeAddressPtr			absoluteAddress;
	TTObjectPtr					anObject;
	TTErr						err;
	
	if (x->address == kTTAdrsEmpty)
		return;
	
	// if the jcom.receive tries to bind an Output object : bind the signal attribute
	if (x->address->getName() == TT("out"))
		x->address = x->address->appendAttribute(kTTSym_signal);
	
	// for absolute address
	if (x->address->getType() == kAddressAbsolute) {
		
		x->wrappedObject->setAttributeValue(kTTSym_address, x->address);
		return;
	}
	
	// for relative address
	jamoma_patcher_get_info((ObjectPtr)x, &x->patcherPtr, &x->patcherContext, &x->patcherClass, &x->patcherName);
	
	if (!jamoma_subscriber_create((ObjectPtr)x, NULL, TTADRS("model/address"), &x->subscriberObject)) {
		
		// get the context address to make
		// a viewer on the contextAddress/model/address parameter
		x->subscriberObject->getAttributeValue(TT("contextAddress"), v);
		v.get(0, (TTSymbolPtr*)&contextAddress);
		
		if (x->patcherContext) {
			makeInternals_receiver(x, contextAddress, TT("/model/address"), gensym("return_model_address"), &anObject);
			anObject->sendMessage(kTTSym_Get);
			return;
		}
	}
	
	// else, if no context, set address directly
	else if (x->patcherContext == NULL) {
		contextAddress = kTTAdrsRoot;
		absoluteAddress = contextAddress->appendAddress(x->address);
		x->wrappedObject->setAttributeValue(kTTSym_address, absoluteAddress);
		return;
	}
	
	// otherwise while the context node is not registered : try to binds again :(
	// (to -- this is not a good way todo. For binding we should make a subscription 
	// to a notification mechanism and each time an TTObjet subscribes to the namespace
	// using jamoma_subscriber_create we notify all the externals which have used 
	// jamoma_subscriber_create with NULL object to bind)
	
	// release the subscriber
	TTObjectRelease(TTObjectHandle(&x->subscriberObject));
	x->subscriberObject = NULL;
	
	x->argc++; // the index member is usefull to count how many time the external tries to bind
	if (x->argc > 100) {
		object_error((ObjectPtr)x, "tries to bind too many times on %s", x->address->getCString());
		object_obex_dumpout((ObjectPtr)x, gensym("error"), 0, NULL);
		return;
	}
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)receive_subscribe, NULL, 0, 0);
}

void receive_return_model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTNodeAddressPtr			absoluteAddress;
	
	if (argc && argv) {
		
		// set address attribute of the wrapped Receiver object
		absoluteAddress = TTADRS(atom_getsym(argv)->s_name)->appendAddress(x->address);
		x->wrappedObject->setAttributeValue(kTTSym_address, absoluteAddress);
		x->argc = 0; // the index member is usefull to count how many time the external tries to bind
		
		JamomaDebug object_post((ObjectPtr)x, "binds on %s", absoluteAddress->getCString());
	}
}

#ifndef JCOM_RECEIVE_TILDE
void receive_return_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	outlet_anything(x->outlets[address_out], msg, argc, argv);
}

void receive_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue		v;
	TTObjectPtr anObject;
	
	// avoid blank before data
	if (msg == _sym_nothing)
		outlet_atoms(x->outlets[data_out], argc, argv);
	else
		outlet_anything(x->outlets[data_out], msg, argc, argv);
}
#endif

#pragma mark -
#pragma mark Methods bound to input/inlets

// Method for Assistance Messages
void receive_assist(TTPtr self, void *b, long msg, long arg, char *dst)
{
	if (msg==1)			// Inlets
		strcpy(dst, "");		
	else {							// Outlets
		switch(arg) {
			case address_out:
				strcpy(dst, "address output");
				break;
			case data_out:
				strcpy(dst, "data output");
				break;
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
 	}
}

#ifndef JCOM_RECEIVE_TILDE

void receive_bang(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// catch error : dump an error
	if (x->wrappedObject->sendMessage(kTTSym_Get))
		object_obex_dumpout(self, _sym_error, 0, NULL);
}

#endif

void receive_set(TTPtr self, SymbolPtr address)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	x->address =  TTADRS(jamoma_parse_dieze((ObjectPtr)x, address)->s_name);
	
	receive_subscribe(self);
}

#pragma mark -
#pragma mark Methods relating to audio processing

#ifdef JCOM_RECEIVE_TILDE
// Perform Method - just pass the whole vector straight through
// (the work is all done in the dsp method)
t_int *receive_perform(t_int *w)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)(w[1]);
	TTReceiverPtr				aReceiver = (TTReceiverPtr)x->wrappedObject;
	TTListPtr					objectCache = NULL;
	TTObjectPtr					anObject;
	TTUInt16					vectorSize = 0;
	TTValue						v;
	TTFloat32					d;
	
	if (aReceiver) {
		
		// get signal vectorSize
		aReceiver->mSignal->getAttributeValue(kTTSym_vectorSize, vectorSize);
		
		// store the input
		TTAudioSignalPtr(aReceiver->mSignal)->setVector(0, vectorSize, (TTFloat32*)w[2]);
		
		// get the object cache of the Sender object
		if (!x->wrappedObject->getAttributeValue(kTTSym_objectCache, v)) {
			
			v.get(0, (TTPtr*)&objectCache);
			
			if (objectCache) {
				
				// sum all output signals
				for (objectCache->begin(); objectCache->end(); objectCache->next()) {
					
					anObject = NULL;
					objectCache->current().get(0, (TTPtr*)&anObject);
					
					if (anObject) {
						
						// OUTPUT case : sum the signal from the output
						if (anObject->getName() == TT("Output")) {
							
							// get output signal vectorSize
							TTOutputPtr(anObject)->mSignalOut->getAttributeValue(kTTSym_vectorSize, vectorSize);
							
							// sum output signal
							*TTAudioSignalPtr(aReceiver->mSignal) += *TTAudioSignalPtr(TTOutputPtr(anObject)->mSignalOut);
						}
						
						// DATA case : fill a signal with the data value and sum it
						else if (anObject->getName() == TT("Data")) {
							
							// get value
							anObject->getAttributeValue(kTTSym_value, v);
							v.get(0, d);
							
							// TEST : fill the signal with the value
							// TODO : add a += TTFloat64 inline method to TTAudioSignal class  
							TTAudioSignalPtr(aReceiver->mSignal)->fill(d);
						}
					}
				}
			}
			
			// send signal to the outlet
			TTAudioSignalPtr(aReceiver->mSignal)->getVector(0, vectorSize, (TTFloat32*)w[3]);
		}
	}
	
	return w + 4;
}

// DSP Method
void receive_dsp(TTPtr self, t_signal **sp, short *count)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTReceiverPtr				aReceiver = (TTReceiverPtr)x->wrappedObject;
	void**						audioVectors = NULL;
	TTUInt16					vectorSize = sp[0]->s_n;
	int							sr = sp[0]->s_sr;
	
	if (aReceiver) {
		
		audioVectors = (void**)sysmem_newptr(sizeof(void*) * 3);
		audioVectors[0] = x;
		
		if (count[0] || count[1]) {
			if (sp[0]->s_n > vectorSize)
				vectorSize = sp[0]->s_n;
			
			audioVectors[1] = sp[0]->s_vec;
			audioVectors[2] = sp[1]->s_vec;
		}
		
		// set signal numChannels and vectorSize
		aReceiver->mSignal->setAttributeValue(kTTSym_numChannels, 1);
		aReceiver->mSignal->setAttributeValue(kTTSym_vectorSize, vectorSize);
		
		// anOutput->mSignal will be set in the perform method
		aReceiver->mSignal->sendMessage(kTTSym_alloc);
		
		dsp_addv(receive_perform, 3, audioVectors);
		sysmem_freeptr(audioVectors);
	}	
}

// Perform Method 64 bit - just pass the whole vector straight through
// (the work is all done in the dsp 64 bit method)
void receive_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTReceiverPtr				aReceiver = (TTReceiverPtr)x->wrappedObject;
	TTOutputPtr					anOutput;
	TTUInt8						numChannels = 0;
	TTUInt16					vectorSize = 0;
	short						i; 
	TTUInt16					n;
	
	/*
	// get numChannels and vectorSize
	if (anOutput) {
		
		anOutput->mInfo.get(info_numChannels, numChannels);
		anOutput->mInfo.get(info_vectorSize, vectorSize);
		
		// Store the input from the inlets
		for (i=0; i < numChannels; i++)
			TTAudioSignalPtr(anOutput->mSignalIn)->setVector(i, vectorSize, ins[i]);
		// if this doesn't work, I need to try setVector64Copy instead of setVector
		
		
		if (anInput->mBypass)																		// perform mix control
			TTAudioSignal::copy(*TTAudioSignalPtr(anInput->mSignalOut), *TTAudioSignalPtr(anOutput->mSignalOut));							//TODO: ideally just passing the pointer without copying memory 
		else if ((anOutput->mMute) || (!anOutput->mGain))
			TTAudioSignalPtr(anOutput->mSignalOut)->clear();  
		else {																					// perform mix control
			anInput->mInfo.get(info_numChannels, inNumCh);
			if (anInput && inNumCh) { 
				if (anOutput->mMix == 100) // fully wet
					TTAudioSignal::copy(*TTAudioSignalPtr(anOutput->mSignalIn), *TTAudioSignalPtr(anOutput->mSignalTemp));			//TODO: ideally just passing the pointer without copying memory 
				else if(!anOutput->mMix) //fully dry
					TTAudioSignal::copy(*TTAudioSignalPtr(anInput->mSignalOut), *TTAudioSignalPtr(anOutput->mSignalTemp));			//TODO: ideally just passing the pointer without copying memory 
				else // we mix wet and dry
					TTAudioObjectPtr(anOutput->mMixUnit)->process(TTAudioSignalPtr(anInput->mSignalOut), TTAudioSignalPtr(anOutput->mSignalIn), TTAudioSignalPtr(anOutput->mSignalTemp));
			}
			else
				TTAudioSignal::copy(*TTAudioSignalPtr(anOutput->mSignalIn), *TTAudioSignalPtr(anOutput->mSignalTemp));
			
			TTAudioObjectPtr(anOutput->mGainUnit)->process(TTAudioSignalPtr(anOutput->mSignalTemp), TTAudioSignalPtr(anOutput->mSignalOut));			// perform gain control
		}
		
		// Send the input on to the outlets for the algorithm
		for (i=0; i < numChannels; i++){	
			TTAudioSignalPtr(anOutput->mSignalOut)->getVectorCopy(i, vectorSize, outs[i]);
			
			// metering
			if (!anOutput->mMute) {
				TTSampleValue* envelope = outs[i];
				peakvalue = 0.0;
				
				n = vectorSize;
				while (n--) {
					if ((*envelope) < 0 )						// get the current sample's absolute value
						currentvalue = -(*envelope); //TODO: we could do a sign flip instead of multiply
					else
						currentvalue = *envelope;
					
					if (currentvalue > peakvalue) 					// if it's a new peak amplitude...
						peakvalue = currentvalue;
					envelope++; 										// increment pointer in the vector
				}
				
				// set meter[i]
				anOutput->mInfo.set(info_startMeter+i, peakvalue);
				
				// set peak[i]
				anOutput->mInfo.get(info_startMeter+numChannels+i, peakamp);
				if (peakvalue > peakamp)
					anOutput->mInfo.set(info_startMeter+numChannels+i, peakvalue);
			}
		}
	}
	 */
}

// DSP64 method
void receive_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTReceiverPtr				aReceiver = (TTReceiverPtr)x->wrappedObject;
	TTOutputPtr					anOutput;
	TTUInt8						numChannels = 0;
	short						i, j; 
	
	/*
	anOutput->mRampGainUnit->setAttributeValue(kTTSym_sampleRate, samplerate);	// convert midi to db for tap_gain
	anOutput->mGainUnit->setAttributeValue(TT("interpolated"), 1);
	anOutput->mRampMixUnit->setAttributeValue(kTTSym_sampleRate, samplerate);	// convert midi to db for tap_gain
	
	for (i=0; i < anOutput->mNumber; i++) {
		j = anOutput->mNumber + i;
		if (count[i] || count[j]) {
			numChannels++;			
		}
	}
	anOutput->mInfo.set(info_numChannels, numChannels);
	
	anOutput->mInfo.set(info_vectorSize, (TTUInt16)maxvectorsize);
	
	anOutput->mSignalIn->setAttributeValue(TT("numChannels"), numChannels);
	anOutput->mSignalOut->setAttributeValue(TT("numChannels"), numChannels);
	anOutput->mSignalTemp->setAttributeValue(TT("numChannels"), numChannels);
	//anOutput->mSignalZero->setAttributeValue(TT("numChannels"), numChannels);
	
	anOutput->mSignalIn->setAttributeValue(TT("vectorSize"), (TTUInt16)maxvectorsize);
	anOutput->mSignalOut->setAttributeValue(TT("vectorSize"), (TTUInt16)maxvectorsize);
	anOutput->mSignalTemp->setAttributeValue(TT("vectorSize"), (TTUInt16)maxvectorsize);
	//anOutput->mSignalZero->setAttributeValue(TT("vectorSize"), (TTUInt16)maxvectorsize);//Do we need zeroSignal?
	
	// mSignalIn will be set in the perform method
	anOutput->mSignalOut->sendMessage(TT("alloc"));
	anOutput->mSignalTemp->sendMessage(TT("alloc"));
	//x->zeroSignal->sendMessage(TT("alloc"));
	//x->zeroSignal->sendMessage(TT("clear"));
	//audioIn will be set in the perform method
	//x->audioOut->sendMessage(TT("alloc"));
	
	*/
	
	object_method(dsp64, gensym("dsp_add64"), x, receive_perform64, 0, NULL); 
}

#endif // JCOM_RECEIVE_TILDE