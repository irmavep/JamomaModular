/* 
 * jcom.ui
 * External for Jamoma: provide standard user interface component for modules
 * By Tim Place, Copyright © 2007
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "jcom.ui.h"

void ui_data_create_all(t_ui* obj)
{
	TTObjectPtr		anObject;
	TTString		uiStr, parentStr, dataStr;
	TTValue			v;
	
	// create a ui node with our patcher as context
	anObject = NULL;
	TTObjectInstantiate(TT("Container"), &anObject, kTTValNONE);
	if (!jamoma_subscriber_create((ObjectPtr)obj, anObject, TTADRS("ui"), &obj->uiSubscriber)) {
		
		// get info relative to our patcher
		jamoma_patcher_get_info((ObjectPtr)obj, &obj->patcherPtr, &obj->patcherContext, &obj->patcherClass, &obj->patcherName);
		
		// get the view address
		obj->uiSubscriber->getAttributeValue(TT("contextAddress"), v);
		v.get(0, &obj->viewAddress);
		
		// make a receiver on contextAddress/model/address data
		ui_receiver_create(obj, &anObject, gensym("return_model_address"), TT("model/address"), obj->viewAddress);
		
		// Then create all internal datas concerning the jcom.ui
		// ui/color/contentBackground
		ui_data_create(obj, &anObject, gensym("return_color_contentBackground"), kTTSym_parameter, TT("color/contentBackground"));
		anObject->setAttributeValue(kTTSym_type, kTTSym_array);
		anObject->setAttributeValue(kTTSym_tag, kTTSym_generic);
		anObject->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
		anObject->setAttributeValue(kTTSym_description, TT("The background color of the module in the format RGBA where values range [0.0, 1.0]."));
		
		// ui/color/toolbarBackground
		ui_data_create(obj, &anObject, gensym("return_color_toolbarBackground"), kTTSym_parameter, TT("color/toolbarBackground"));
		anObject->setAttributeValue(kTTSym_type, kTTSym_array);
		anObject->setAttributeValue(kTTSym_tag, kTTSym_generic);
		anObject->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
		anObject->setAttributeValue(kTTSym_description, TT("The background color of the module's toolbar in the format RGBA where values range [0.0, 1.0]."));
		
		// ui/color/toolbarText
		ui_data_create(obj, &anObject, gensym("return_color_toolbarText"), kTTSym_parameter, TT("color/toolbarText"));
		anObject->setAttributeValue(kTTSym_type, kTTSym_array);
		anObject->setAttributeValue(kTTSym_tag, kTTSym_generic);
		anObject->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
		anObject->setAttributeValue(kTTSym_description, TT("The color of the module's toolbar text in the format RGBA where values range [0.0, 1.0]."));
		
		// ui/color/border
		ui_data_create(obj, &anObject, gensym("return_color_border"), kTTSym_parameter, TT("color/border"));
		anObject->setAttributeValue(kTTSym_type, kTTSym_array);
		anObject->setAttributeValue(kTTSym_tag, kTTSym_generic);
		anObject->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
		anObject->setAttributeValue(kTTSym_description, TT("The border color of the module in the format RGBA where values range [0.0, 1.0]."));
		
		// ui/size
		ui_data_create(obj, &anObject, gensym("return_ui_size"), kTTSym_parameter, TT("size"));
		anObject->setAttributeValue(kTTSym_type, kTTSym_array);
		anObject->setAttributeValue(kTTSym_tag, kTTSym_generic);
		anObject->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
		anObject->setAttributeValue(kTTSym_description, TT("The size of the view's UI."));
		
		v = TTValue(obj->box.b_patching_rect.width);
		v.append(obj->box.b_patching_rect.height);
		anObject->setAttributeValue(kTTSym_value, v);
		
		// ui/freeze
		ui_data_create(obj, &anObject, gensym("return_ui_freeze"), kTTSym_parameter, TT("freeze"));
		anObject->setAttributeValue(kTTSym_type, kTTSym_boolean);
		anObject->setAttributeValue(kTTSym_tag, kTTSym_generic);
		anObject->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
		anObject->setAttributeValue(kTTSym_description, TT("Freeze each jcom.view in the patch"));
		
		// ui/refresh
		ui_data_create(obj, &anObject, gensym("return_ui_refresh"), kTTSym_message, TT("refresh"));
		anObject->setAttributeValue(kTTSym_type, kTTSym_none);
		anObject->setAttributeValue(kTTSym_tag, kTTSym_generic);
		anObject->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
		anObject->setAttributeValue(kTTSym_description, TT("Refresh each jcom.view in the patch"));
	}
}

void ui_data_destroy_all(t_ui *obj)
{
	TTValue			hk, v;
	TTSymbolPtr		key;
	TTUInt8			i;
	
	// delete all datas
	if (obj->hash_datas) {
		
		if (!obj->hash_datas->isEmpty()) {
			
			obj->hash_datas->getKeys(hk);
			for (i=0; i<obj->hash_datas->getSize(); i++) {
				
				hk.get(i,(TTSymbolPtr*)&key);
				ui_data_destroy(obj, key);
			}
		}
		delete obj->hash_datas;
	}
}

void ui_data_create(t_ui *obj, TTObjectPtr *returnedData, SymbolPtr aCallbackMethod, TTSymbolPtr service, TTSymbolPtr name)
{
	TTValue			args, v;
	TTObjectPtr		returnValueCallback;
	TTValuePtr		returnValueBaton;
	TTNodeAddressPtr uiAddress, dataAddress;
	TTNodePtr		aNode;
	TTBoolean		nodeCreated;
	
	// Prepare arguments to create a TTData object
	returnValueCallback = NULL;			// without this, TTObjectInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectInstantiate(TT("callback"), &returnValueCallback, kTTValNONE);
	returnValueBaton = new TTValue(TTPtr(obj));
	returnValueBaton->append(TTPtr(aCallbackMethod));
	returnValueCallback->setAttributeValue(kTTSym_baton, TTPtr(returnValueBaton));
	returnValueCallback->setAttributeValue(kTTSym_function, TTPtr(&jamoma_callback_return_value));
	args.append(returnValueCallback);
	
	args.append(service);
	
	*returnedData = NULL;
	TTObjectInstantiate(TT("Data"), TTObjectHandle(returnedData), args);
	
	// Register data
	obj->uiSubscriber->getAttributeValue(TT("nodeAddress"), v);
	v.get(0, &uiAddress);
	dataAddress = uiAddress->appendAddress(TTADRS(name->getCString()));
	JamomaDirectory->TTNodeCreate(dataAddress, *returnedData, obj->patcherPtr, &aNode, &nodeCreated);
	
	// Store data
	args = TTValue(TTPtr(*returnedData));
	args.append(dataAddress);
	obj->hash_datas->append(name, args);
	
	// DEBUG
	object_post((ObjectPtr)obj, "Make internal ui/%s object at : %s", name->getCString(), dataAddress->getCString());
}								   

void ui_data_destroy(t_ui *obj, TTSymbolPtr name)
{
	TTValue			storedObject;
	TTObjectPtr		aData;
	TTNodeAddressPtr dataAddress;
	
	if (obj->hash_datas)
		if (!obj->hash_datas->lookup(name, storedObject)) {
			
			// Unregister data
			storedObject.get(1, &dataAddress);
			JamomaDirectory->TTNodeRemove(dataAddress);
			
			// Delete data
			storedObject.get(0, (TTPtr*)&aData);
			if (aData)
				if (aData->valid)	// to -- should be better to understand why the data is not valid
					TTObjectRelease(&aData);
			
			// don't remove from the hash_table here !
		}
}

void ui_data_send(t_ui *obj, TTSymbolPtr name, TTValue v)
{
	TTValue			storedObject;
	TTObjectPtr		anObject;
	
	obj->hash_datas->lookup(name, storedObject);
	storedObject.get(0, (TTPtr*)&anObject);
	
	anObject->setAttributeValue(kTTSym_value, v);
}

void ui_data_interface(t_ui *x, TTSymbolPtr name)
{
	char			filename[MAX_FILENAME_CHARS];
	short			path;
	long			type;
	long			filetype = 'JSON';
	t_dictionary*	d;
	ObjectPtr		p;
	TTNodeAddressPtr address;
	Atom			a;
	
	strncpy_zero(filename, "jcom.reference_interface.maxpat", MAX_FILENAME_CHARS);
	locatefile_extended(filename, &path, &type, &filetype, 1);
	dictionary_read(filename, path, &d);
	
	atom_setobj(&a, d);
	p = (t_object*)object_new_typed(_sym_nobox, _sym_jpatcher, 1, &a);
	object_attr_setlong(p, _sym_locked, 1);										// start out locked
	object_attr_setchar(p, _sym_enablehscroll, 0);								// turn off scroll bars
	object_attr_setchar(p, _sym_enablevscroll, 0);
	object_attr_setchar(p, _sym_openinpresentation, 1);	
	object_attr_setchar(p, _sym_toolbarvisible, 0);	
	object_attr_setsym(p, _sym_title, gensym("reference_interface"));		
	object_method_parse(p, _sym_window, "constrain 5 320 200 500", NULL);
	object_attach_byptr_register(x, p, _sym_nobox);
	
	object_method(p, _sym_vis);													// "vis" happens immediately, "front" is defer_lowed
	object_attr_setobj(jpatcher_get_firstview(p), _sym_owner, (t_object*)x);	// become the owner
	
	address = x->modelAddress->appendAddress(TTADRS(name->getCString()));
	
	OBJ_ATTR_SYM(p, "arguments", 0, gensym((char*)address->getCString()));		// the patch needs a [jcom.interfaceArguments.js]
	
	object_method(p, _sym_loadbang);
}

void ui_receiver_create(t_ui *obj, TTObjectPtr *returnedReceiver, SymbolPtr aCallbackMethod, TTSymbolPtr name, TTNodeAddressPtr address)
{
	TTValue			v, args;
	TTObjectPtr		returnValueCallback;
	TTValuePtr		returnValueBaton;
	TTNodeAddressPtr adrs;
	
	// prepare arguments
	args.append(NULL);
	
	returnValueCallback = NULL;			// without this, TTObjectInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectInstantiate(TT("callback"), &returnValueCallback, kTTValNONE);
	returnValueBaton = new TTValue(TTPtr(obj));
	returnValueBaton->append(TTPtr(aCallbackMethod));
	returnValueCallback->setAttributeValue(kTTSym_baton, TTPtr(returnValueBaton));
	returnValueCallback->setAttributeValue(kTTSym_function, TTPtr(&jamoma_callback_return_value));
	args.append(returnValueCallback);
	
	*returnedReceiver = NULL;
	TTObjectInstantiate(TT("Receiver"), TTObjectHandle(returnedReceiver), args);
	
	// Set address to bind
	adrs = address->appendAddress(TTADRS(name->getCString()));
	(*returnedReceiver)->setAttributeValue(TT("address"), adrs);
	
	// refresh receiver
	(*returnedReceiver)->sendMessage(kTTSym_Get);
	
	// Store receiver
	args = TTValue(TTPtr(*returnedReceiver));
	obj->hash_receivers->append(name, args);
}

void ui_receiver_destroy(t_ui *obj, TTSymbolPtr name)
{
	TTValue			storedObject;
	TTObjectPtr		aReceiver;
	
	if (obj->hash_receivers)
		if (!obj->hash_receivers->lookup(name, storedObject)) {
			
			// delete
			storedObject.get(0, (TTPtr*)&aReceiver);
			if (aReceiver)
				if (aReceiver->valid)	// to -- should be better to understand why the receiver is not valid
					TTObjectRelease(&aReceiver);
			
			// don't remove from the hash_table here !
		}
}

void ui_receiver_destroy_all(t_ui *obj)
{
	TTValue			hk, v;
	TTSymbolPtr		key;
	TTUInt8			i;
	
	// delete all viewers
	if (obj->hash_receivers) {
		
		if (!obj->hash_receivers->isEmpty()) {
			
			obj->hash_receivers->getKeys(hk);
			
			for (i=0; i<obj->hash_receivers->getSize(); i++) {
				
				hk.get(i,(TTSymbolPtr*)&key);
				ui_receiver_destroy(obj, key);
			}
		}
		delete obj->hash_receivers;
	}
}

void ui_viewer_create(t_ui *obj, TTObjectPtr *returnedViewer, SymbolPtr aCallbackMethod, TTSymbolPtr name, TTNodeAddressPtr address, TTBoolean subscribe)
{
	TTValue			v, args;
	TTObjectPtr		returnValueCallback;
	TTValuePtr		returnValueBaton;
	TTNodeAddressPtr uiAddress, viewerAddress, adrs;
	TTNodePtr		aNode;
	TTBoolean		nodeCreated;
	
	// prepare arguments
	returnValueCallback = NULL;			// without this, TTObjectInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectInstantiate(TT("callback"), &returnValueCallback, kTTValNONE);
	returnValueBaton = new TTValue(TTPtr(obj));
	returnValueBaton->append(TTPtr(aCallbackMethod));
	returnValueCallback->setAttributeValue(kTTSym_baton, TTPtr(returnValueBaton));
	returnValueCallback->setAttributeValue(kTTSym_function, TTPtr(&jamoma_callback_return_value));
	args.append(returnValueCallback);
	
	*returnedViewer = NULL;
	TTObjectInstantiate(TT("Viewer"), TTObjectHandle(returnedViewer), args);
	
	if (subscribe) {
		// Register viewer
		obj->uiSubscriber->getAttributeValue(TT("nodeAddress"), v);
		v.get(0, &uiAddress);
		
		viewerAddress = uiAddress->appendAddress(TTADRS(name->getCString()));
		
		JamomaDirectory->TTNodeCreate(viewerAddress, *returnedViewer, obj->patcherPtr, &aNode, &nodeCreated);
	}
	else
		viewerAddress = kTTAdrsEmpty;
	
	// Set address to bind
	adrs = address->appendAddress(TTADRS(name->getCString()));
	(*returnedViewer)->setAttributeValue(TT("address"), adrs);
	
	// refresh viewer
	(*returnedViewer)->sendMessage(kTTSym_Refresh);
	
	// Store viewer
	args = TTValue(TTPtr(*returnedViewer));
	args.append(viewerAddress);
	obj->hash_viewers->append(name, args);
}

void ui_viewer_destroy(t_ui *obj, TTSymbolPtr name)
{
	TTValue			storedObject;
	TTObjectPtr		aViewer;
	TTNodeAddressPtr viewerAddress;
	
	if (obj->hash_viewers)
		if (!obj->hash_viewers->lookup(name, storedObject)) {
			
			// Unregister data
			storedObject.get(1, &viewerAddress);
			if (viewerAddress != kTTAdrsEmpty)
				JamomaDirectory->TTNodeRemove(viewerAddress);
			
			// delete
			storedObject.get(0, (TTPtr*)&aViewer);
			if (aViewer)
				if (aViewer->valid)	// to -- should be better to understand why the viewer is not valid
					TTObjectRelease(&aViewer);
			
			// don't remove from the hash_table here !
		}
}

void ui_viewer_destroy_all(t_ui *obj)
{
	TTValue			hk, v;
	TTSymbolPtr		key;
	TTUInt8			i;
	
	// delete all viewers
	if (obj->hash_viewers) {
		
		if (!obj->hash_viewers->isEmpty()) {
			
			obj->hash_viewers->getKeys(hk);
			
			for (i=0; i<obj->hash_viewers->getSize(); i++) {
				
				hk.get(i,(TTSymbolPtr*)&key);
				ui_viewer_destroy(obj, key);
			}
		}
		delete obj->hash_viewers;
	}
}

void ui_viewer_send(t_ui *obj, TTSymbolPtr name, TTValue v)
{
	TTValue			storedObject;
	TTObjectPtr		anObject;
	TTErr			err;
	if (obj->hash_viewers) {
		err = obj->hash_viewers->lookup(name, storedObject);
		
		if (!err) {
			storedObject.get(0, (TTPtr*)&anObject);
			if (anObject)
				anObject->sendMessage(kTTSym_Send, v, kTTValNONE);
		}
	}
}

void ui_viewer_select(t_ui *obj, TTSymbolPtr name, TTBoolean s)
{
	TTValue			storedObject;
	TTObjectPtr		anObject;
	TTErr			err;
	if (obj->hash_viewers) {
		err = obj->hash_viewers->lookup(name, storedObject);
		
		if (!err) {
			storedObject.get(0, (TTPtr*)&anObject);
			if (anObject)
				anObject->setAttributeValue(kTTSym_selected, s);
		}
	}
}

void ui_viewer_freeze(t_ui *obj, TTSymbolPtr name, TTBoolean f)
{
	TTValue			storedObject;
	TTObjectPtr		anObject;
	TTErr			err;
	if (obj->hash_viewers) {
		err = obj->hash_viewers->lookup(name, storedObject);
		
		if (!err) {
			storedObject.get(0, (TTPtr*)&anObject);
			if (anObject)
				anObject->setAttributeValue(kTTSym_freeze, f);
		}
	}
}

void ui_viewer_refresh(t_ui *obj, TTSymbolPtr name)
{
	TTValue			storedObject;
	TTObjectPtr		anObject;
	TTErr			err;
	if (obj->hash_viewers) {
		err = obj->hash_viewers->lookup(name, storedObject);
		
		if (!err) {
			storedObject.get(0, (TTPtr*)&anObject);
			if (anObject)
				anObject->sendMessage(kTTSym_Refresh);
		}
	}
}

#if 0
#pragma mark -
#pragma mark message handlers
#endif

void ui_explorer_create(ObjectPtr x, TTObjectPtr *returnedExplorer, SymbolPtr method)
{
	TTValue			args;
	TTObjectPtr		returnValueCallback;
	TTValuePtr		returnValueBaton;
	
	// prepare arguments
	returnValueCallback = NULL;			// without this, TTObjectInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectInstantiate(TT("callback"), &returnValueCallback, kTTValNONE);
	returnValueBaton = new TTValue(TTPtr(x));
	returnValueBaton->append(TTPtr(method));
	returnValueCallback->setAttributeValue(kTTSym_baton, TTPtr(returnValueBaton));
	returnValueCallback->setAttributeValue(kTTSym_function, TTPtr(&jamoma_callback_return_value));
	args.append(returnValueCallback);
	
	args.append((TTPtr)jamoma_explorer_default_filter_bank());
	
	*returnedExplorer = NULL;
	TTObjectInstantiate(TT("Explorer"), TTObjectHandle(returnedExplorer), args);
}

void ui_modelExplorer_callback(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	TTObjectPtr anObject;
	TTBoolean	gain = false;
	TTBoolean	mix = false;
	TTBoolean	bypass = false;
	TTBoolean	freeze = false;
	TTBoolean	preview = false;
	TTBoolean	mute = false;
	TTBoolean	internals = false;
	TTBoolean	meters = false;
	TTBoolean	preset = false;			// is there a /preset node in the model ?
	TTBoolean	help = false;			// is there a help patch for the model ?
	TTBoolean	ref = false;			// is there a ref page for the model ?
	TTBoolean	change = false;
	SymbolPtr	paramName;
	
	// model namespace observation
	if (obj->modelAddress != kTTAdrsEmpty) {
		
		// look the namelist to know which data exist
		for (long i=0; i<argc; i++) {
			
			paramName = atom_getsym(argv+i);
			
			if (paramName == gensym("out/gain"))
				gain = true;
			else if (paramName == gensym("out/mix"))
				mix = true;
			else if (paramName == gensym("in/bypass"))
				bypass = true;
			else if (paramName == gensym("out/freeze"))
				freeze = true;
			else if (paramName == gensym("out/preview"))
				preview = true;
			else if (paramName == gensym("out/mute"))
				mute = true;
			else if (paramName == gensym("model/internals"))		// TODO : create sender (a viewer is useless)
				internals = true;
			else if (paramName == gensym("audio/meters/freeze"))
				meters = true;
			else if (paramName == gensym("preset/store"))			// the internal TTExplorer looks for Datas (not for node like /preset)
				preset = true;
			else if (paramName == gensym("model/help"))			// TODO : create sender (a viewer is useless)
				help = true;
			else if (paramName == gensym("model/reference"))		// TODO : create sender (a viewer is useless)
				ref = true;
		}
		
		// if a data appears or disappears : create or remove the viewer
		
		// gain
		if (gain != obj->has_gain) {
			obj->has_gain = gain;
			if (gain) 
				ui_viewer_create(obj, &anObject, gensym("return_gain"), TT("out/gain"), obj->modelAddress, YES);
			else {
				ui_viewer_destroy(obj, TT("out/gain"));
				obj->hash_viewers->remove(TT("out/gain"));
			}
		}
		
		// mix
		if (mix != obj->has_mix) {
			obj->has_mix = mix;
			if (mix) 
				ui_viewer_create(obj, &anObject, gensym("return_mix"), TT("out/mix"), obj->modelAddress, YES);
			else {
				ui_viewer_destroy(obj, TT("out/mix"));
				obj->hash_viewers->remove(TT("out/mix"));
			}
			
			change = true;
		}
		
		// bypass
		if (bypass != obj->has_bypass) {
			obj->has_bypass = bypass;
			if (bypass) 
				ui_viewer_create(obj, &anObject, gensym("return_bypass"), TT("in/bypass"), obj->modelAddress, YES);
			else {
				ui_viewer_destroy(obj, TT("in/bypass"));
				obj->hash_viewers->remove(TT("in/bypass"));
			}
			
			change = true;
		}
		
		// freeze
		if (freeze != obj->has_freeze) {
			obj->has_freeze = freeze;
			if (freeze) 
				ui_viewer_create(obj, &anObject, gensym("return_freeze"), TT("out/freeze"), obj->modelAddress, YES);
			else {
				ui_viewer_destroy(obj, TT("out/freeze"));
				obj->hash_viewers->remove(TT("out/freeze"));
			}
			
			change = true;
		}
		
		// preview
		if (preview != obj->has_preview) {
			obj->has_preview = preview;
			if (preview)
				ui_viewer_create(obj, &anObject, gensym("return_preview"), TT("out/preview"), obj->modelAddress, YES);
			else {
				ui_viewer_destroy(obj, TT("out/preview"));
				obj->hash_viewers->remove(TT("out/preview"));
			}
			
			change = true;
		}
		
		// mute
		if (mute != obj->has_mute) {
			obj->has_mute = mute;
			if (mute) 
				ui_viewer_create(obj, &anObject, gensym("return_mute"), TT("out/mute"), obj->modelAddress, YES);
			else {
				ui_viewer_destroy(obj, TT("out/mute"));
				obj->hash_viewers->remove(TT("out/mute"));
			}
			
			change = true;
		}
		
		// internals
		if (internals != obj->has_internals) {
			obj->has_internals = internals;
			if (internals) 
				ui_viewer_create(obj, &anObject, NULL, TT("model/internals"), obj->modelAddress, NO);
			else {
				ui_viewer_destroy(obj, TT("model/internals"));
				obj->hash_viewers->remove(TT("model/internals"));
			}
			
			change = true;
		}
		
		// preset
		if (preset != obj->has_preset) {
			obj->has_preset = preset;
			if (preset) {
				ui_viewer_create(obj, &anObject, NULL, TT("preset/write"), obj->modelAddress, NO);
				ui_viewer_create(obj, &anObject, NULL, TT("preset/read"), obj->modelAddress, NO);
				ui_viewer_create(obj, &anObject, NULL, TT("preset/recall"), obj->modelAddress, NO);
				ui_viewer_create(obj, &anObject, NULL, TT("preset/store/current"), obj->modelAddress, NO);
				ui_viewer_create(obj, &anObject, NULL, TT("preset/store/next"), obj->modelAddress, NO);
				ui_viewer_create(obj, &anObject, gensym("return_preset_names"), TT("preset/names"), obj->modelAddress, NO);
			}
			else {
				ui_viewer_destroy(obj, TT("write"));
				obj->hash_viewers->remove(TT("write"));
				ui_viewer_destroy(obj, TT("read"));
				obj->hash_viewers->remove(TT("read"));
				ui_viewer_destroy(obj, TT("recall"));
				obj->hash_viewers->remove(TT("recall"));
				ui_viewer_destroy(obj, TT("store/current"));
				obj->hash_viewers->remove(TT("store/current"));
				ui_viewer_destroy(obj, TT("store/next"));
				obj->hash_viewers->remove(TT("store/next"));
				ui_viewer_destroy(obj, TT("names"));
				obj->hash_viewers->remove(TT("names"));
			}
			
			change = true;
		}
		
		// help
		if (help != obj->has_help) {
			obj->has_help = help;
			if (help) 
				ui_viewer_create(obj, &anObject, NULL, TT("model/help"), obj->modelAddress, NO);
			else {
				ui_viewer_destroy(obj, TT("model/help"));
				obj->hash_viewers->remove(TT("model/help"));
			}
			
			change = true;
		}
		
		// ref
		if (ref != obj->has_ref) {
			obj->has_ref = ref;
			if (ref) 
				ui_viewer_create(obj, &anObject, NULL, TT("model/reference"), obj->modelAddress, NO);
			else {
				ui_viewer_destroy(obj, TT("model/reference"));
				obj->hash_viewers->remove(TT("model/reference"));
			}
			
			change = true;
		}
		
		if (change)
			jbox_redraw(&obj->box);
		
	}
}

void ui_modelParamExplorer_callback(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	t_symobject	*item = NULL;
	
	// model's message namespace observation
	if (obj->modelAddress != kTTAdrsEmpty) {
		
		// fill item list
		for (long i=0; i<argc; i++) {
			item = (t_symobject *)symobject_new(atom_getsym(argv+i));
			linklist_append(obj->refmenu_items, item);
		}
	}
}

void ui_modelMessExplorer_callback(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	t_symobject	*item = NULL;
	
	// model's message namespace observation
	if (obj->modelAddress != kTTAdrsEmpty) {
		
		// fill item list
		for (long i=0; i<argc; i++) {
			item = (t_symobject *)symobject_new(atom_getsym(argv+i));
			linklist_append(obj->refmenu_items, item);
		}
	}
}

void ui_modelRetExplorer_callback(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	t_symobject	*item = NULL;
	
	// model's message namespace observation
	if (obj->modelAddress != kTTAdrsEmpty) {
		
		// fill item list
		for (long i=0; i<argc; i++) {
			item = (t_symobject *)symobject_new(atom_getsym(argv+i));
			linklist_append(obj->refmenu_items, item);
		}
	}
}

void ui_view_panel_attach(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	t_ui* obj = (t_ui*)self;
	ObjectPtr	box;
	t_outlet*	myoutlet = NULL;
	t_dll*		connecteds = NULL;
	ObjectPtr	o;
	SymbolPtr	name;
	TTObjectPtr aData;
	TTValue		v;
	
	// search through all connected objects for a patcher object
	object_obex_lookup(obj, _sym_pound_B, &box);
	myoutlet = (t_outlet*)jbox_getoutlet((t_jbox*)box, 1);
	if (myoutlet)
		connecteds = (t_dll*)myoutlet->o_dll;
	
	while (connecteds) {
		o = (t_object*)connecteds->d_x1;
		name = object_classname(o);
		if (name == _sym_inlet) {
			o = ((t_inlet *)connecteds->d_x1)->i_owner;
			name = object_classname(o);
			if (name == _sym_jpatcher) {
				
				obj->patcher_panel = o;
				obj->has_panel = true;
				
				// view/panel
				ui_data_create(obj, &aData, gensym("return_view_panel"), kTTSym_message, TT("panel"));
				
				// Set attribute of the data
				aData->setAttributeValue(kTTSym_type, kTTSym_none);
				aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
				aData->setAttributeValue(kTTSym_description, TT("Open a control panel if one is present."));
				aData->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
				
				jbox_redraw(&obj->box);
				return;
			}
		}
		o = NULL;
		name = NULL;
		connecteds = connecteds->d_next;
	}
}

void ui_view_panel_return(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	Atom		a;
	
	// open view panel and set title
	atom_setsym(&a, gensym((char*)obj->viewAddress->getCString()));
	object_attr_setvalueof(obj->patcher_panel, _sym_title, 1, &a);
	object_method(obj->patcher_panel, _sym_vis);
}

void ui_return_metersdefeated(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->is_metersdefeated = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_mute(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->is_muted = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_bypass(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->is_bypassed = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_mix(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->mix = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_gain(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->gain = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_freeze(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->is_frozen = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_preview(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui*			obj = (t_ui*)self;
	TTNodeAddressPtr outAdrs;
	TTValue			v;
	TTNodePtr		aNode;
	TTValuePtr		newBaton;
	TTAttributePtr	anAttribute = NULL;
	TTErr			err;
	
	obj->is_previewing = atom_getlong(argv);
	
	// get the TTOutput object
	if (!obj->modelOutput) {
		outAdrs = obj->modelAddress->appendAddress(TTADRS("out"));
		
		JamomaDirectory->getTTNode(outAdrs, &aNode);
		obj->modelOutput = (TTOutputPtr)aNode->getObject();
	}
	
	if (obj->modelOutput->valid) {
		
		err = obj->modelOutput->findAttribute(TT("signalPreview"), &anAttribute);
		// TODO : check type (audio or control ?)
		if (!err) {
			
			if (obj->is_previewing) {
				
				// reset preview signal
				if (obj->previewSignal) {
					anAttribute->unregisterObserverForNotifications(*(obj->previewSignal));
					TTObjectRelease(TTObjectHandle(&obj->previewSignal));
					obj->previewSignal = NULL;
				}
				
				TTObjectInstantiate(TT("callback"), TTObjectHandle(&obj->previewSignal), kTTValNONE);
				
				newBaton = new TTValue(TTPtr(self));
				obj->previewSignal->setAttributeValue(kTTSym_baton, TTPtr(newBaton));
				obj->previewSignal->setAttributeValue(kTTSym_function, TTPtr(&jamoma_callback_return_signal));
				obj->previewSignal->setAttributeValue(TT("owner"), TT("jcom.ui"));					// this is usefull only to debug
				
				anAttribute->registerObserverForNotifications(*(obj->previewSignal));
			}
			else {
				
				if (obj->previewSignal) {
					anAttribute->unregisterObserverForNotifications(*(obj->previewSignal));
					TTObjectRelease(TTObjectHandle(&obj->previewSignal));
					obj->previewSignal = NULL;
				}
			}
		}
	}
	
	jbox_redraw(&obj->box);
}

void ui_return_ui_size(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	; // do nothing ?
}

void ui_return_ui_refresh(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	// TODO : refresh all jcom.view of the view patch
	// 1. Get the TTContainer object of the view patch
	// 2. use his send message : /*.*:refresh
	
	// refresh all widgets
	// gain
	if (obj->has_gain)
		ui_viewer_refresh(obj, TT("gain"));
	
	// mix
	if (obj->has_mix)
		ui_viewer_refresh(obj, TT("mix"));
	
	// bypass
	if (obj->has_bypass)
		ui_viewer_refresh(obj, TT("bypass"));
	
	// freeze
	if (obj->has_freeze)
		ui_viewer_refresh(obj, TT("freeze"));
	
	// preview
	if (obj->has_preview)
		ui_viewer_refresh(obj, TT("preview"));
	
	// mute
	if (obj->has_mute) 
		ui_viewer_refresh(obj, TT("mute"));
}

void ui_return_ui_freeze(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	if (argc == 1)
		object_attr_setvalueof(obj, gensym("ui_is_frozen"), argc, argv);
	
	// TODO : Freeze all jcom.view of the view patch
	// 1. Get the TTContainer object of the view patch
	// 2. use his send message : /*.*:freeze 0/1
	
	// freeze all widgets
	// gain
	if (obj->has_gain)
		ui_viewer_freeze(obj, TT("gain"), obj->ui_freeze);
	
	// mix
	if (obj->has_mix)
		ui_viewer_freeze(obj, TT("mix"), obj->ui_freeze);
	
	// bypass
	if (obj->has_bypass)
		ui_viewer_freeze(obj, TT("bypass"), obj->ui_freeze);
	
	// freeze
	if (obj->has_freeze)
		ui_viewer_freeze(obj, TT("freeze"), obj->ui_freeze);
	
	// preview
	if (obj->has_preview)
		ui_viewer_freeze(obj, TT("preview"), obj->ui_freeze);
	
	// mute
	if (obj->has_mute) 
		ui_viewer_freeze(obj, TT("mute"), obj->ui_freeze);
	
	// if freeze is disabled : refresh
	if (!obj->ui_freeze)
		ui_return_ui_refresh(self, _sym_nothing, argc, argv);
}

void ui_return_color_contentBackground(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	// Colors default to "0". If default value is passed, we avoid setting the color, in order to stick to object defaults.
	if (argc>1)
		object_attr_setvalueof(obj, _sym_bgcolor, argc, argv);
}

void ui_return_color_toolbarBackground(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	if (argc>1)
		object_attr_setvalueof(obj, gensym("headercolor"), argc, argv);
}

void ui_return_color_toolbarText(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	if (argc>1)
		object_attr_setvalueof(obj, _sym_textcolor, argc, argv);
}

void ui_return_color_border(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	if (argc>1)
		object_attr_setvalueof(obj, gensym("bordercolor"), argc, argv);
}

void ui_return_model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self; 
	
	object_attr_setvalueof(obj, gensym("address"), argc, argv);
}

void ui_return_signal(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	long index;
	
	if (argc && argv) {
		
		index = obj->modelOutput->mIndex;
		
		// only output first signal
		if (index == 0)
			if (msg == _sym_nothing)
				outlet_atoms(obj->outlets[preview_out], argc, argv);
			else
				outlet_anything(obj->outlets[preview_out], msg, argc, argv);
	}
}
