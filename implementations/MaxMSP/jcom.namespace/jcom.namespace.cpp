/* 
 * jcom.namespace
 * External to deal with the Jamoma Namespace
 * By Théo de la Hogue, Copyright 2010
 * 
 * License: This code is licensed under the terms of the GNU LGPL
 * http://www.gnu.org/licenses/lgpl.html 
 */

#include "TTModularClassWrapperMax.h"

#define data_out 0
#define size_out 1
#define dump_out 2

// Definitions
void		WrapTTExplorerClass(WrappedClassPtr c);
void		WrappedExplorerClass_new(TTPtr self, AtomCount argc, AtomPtr argv);

void		nmspc_assist(TTPtr self, void *b, long m, long a, char *s);

void		nmspc_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		nmspc_bang(TTPtr self);
void		nmspc_symbol(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		nmspc_write(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		nmspc_dowrite(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		nmspc_subscribe(TTPtr self);

void		nmspc_return_model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

t_max_err	nmspc_get_format(TTPtr self, TTPtr attr, AtomCount *ac, AtomPtr *av);
t_max_err	nmspc_set_format(TTPtr self, TTPtr attr, AtomCount ac, AtomPtr av);

t_max_err	nmspc_get_relative(TTPtr self, TTPtr attr, AtomCount *ac, AtomPtr *av);
t_max_err	nmspc_set_relative(TTPtr self, TTPtr attr, AtomCount ac, AtomPtr av);

/*
void		nmspc_add_max_namespace(TTPtr self);
long		nmspc_myobject_iterator(TTPtr self, ObjectPtr b);
*/

SymbolPtr nmspc_filter_underscore_instance(SymbolPtr a);


int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTExplorerClass;
	spec->_new = &WrappedExplorerClass_new;
	spec->_free = NULL;
	spec->_any = NULL;
	
	return wrapTTModularClassAsMaxClass(TT("Explorer"), "jcom.namespace", NULL, spec);
}

void WrapTTExplorerClass(WrappedClassPtr c)
{
	// add methods
	class_addmethod(c->maxClass, (method)nmspc_assist,				"assist",					A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)nmspc_return_value,		"return_value",				A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)nmspc_return_model_address,"return_model_address",		A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)nmspc_bang,				"bang",						0);
	
	class_addmethod(c->maxClass, (method)nmspc_symbol,				"anything",					A_GIMME, 0);

	class_addmethod(c->maxClass, (method)nmspc_write,				"write",					A_GIMME, 0);
	
	class_addmethod(c->maxClass, (method)nmspc_bang,				"explore",					0); // overwrite explore message to use the bang method

	//class_addmethod(c->maxClass, (method)nmspc_add_max_namespace,	"add_max_namespace",		0);
	
	CLASS_ATTR_ENUM(c->maxClass,		"output",	0,		"descendants children brothers attributes");
	
	CLASS_ATTR_SYM(c->maxClass,			"format",	0,		WrappedModularInstance,	msg);	// use msg member to store format
	CLASS_ATTR_ACCESSORS(c->maxClass,	"format",	nmspc_get_format,	nmspc_set_format);
	CLASS_ATTR_ENUM(c->maxClass,		"format",	0,		"none umenu umenu_prefix jit.cellblock coll");

	CLASS_ATTR_LONG(c->maxClass,		"relative",	0,		WrappedModularInstance,	index);	// use index member to store relative
	CLASS_ATTR_ACCESSORS(c->maxClass,	"relative",	nmspc_get_relative,	nmspc_set_relative);
	CLASS_ATTR_STYLE(c->maxClass,		"relative",	0,		"onoff");
}

void WrappedExplorerClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
	TTOpmlHandlerPtr			aOpmlHandler;
	TTValue						v, args;
	
	// create the explorer
	jamoma_explorer_create((ObjectPtr)x, &x->wrappedObject);
	
	// Make two outlets
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 2);
	x->outlets[size_out] = outlet_new(x, NULL);
	x->outlets[data_out] = outlet_new(x, NULL);
	
	x->msg = _sym_none;
	
	// Prepare Internals hash to store XmlHanler object
	x->internals = new TTHash();
	
	// create internal TTOpmlHandler
	aOpmlHandler = NULL;
	TTObjectInstantiate(TT("OpmlHandler"), TTObjectHandle(&aOpmlHandler), args);
	v = TTValue(TTPtr(aOpmlHandler));
	x->internals->append(TT("OpmlHandler"), v);
	v = TTValue(TTPtr(x->wrappedObject));
	aOpmlHandler->setAttributeValue(kTTSym_object, v);
	
	// handle attribute args
	attr_args_process(x, argc, argv);
}

void nmspc_assist(TTPtr self, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 						// Inlet
		strcpy(dst, "input");
	else {							// Outlets
		switch(arg) {
			case data_out:
				strcpy(dst, "result of exploration");
				break;
			case size_out:
				strcpy(dst, "size of the result");
				break;
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
 	}
}

void nmspc_subscribe(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue						v;
	TTNodeAddressPtr			contextAddress = kTTAdrsEmpty;
	TTNodeAddressPtr			absoluteAddress;
	TTObjectPtr					anObject;
	
	jamoma_patcher_get_info((ObjectPtr)x, &x->patcherPtr, &x->patcherContext, &x->patcherClass, &x->patcherName);
	
	if (!jamoma_subscriber_create((ObjectPtr)x, NULL, kTTAdrsEmpty, &x->subscriberObject)) {
		// get the context address to make
		// a receiver on the contextAddress/model/address parameter
		x->subscriberObject->getAttributeValue(TT("contextAddress"), v);
		v.get(0, (TTSymbolPtr*)&contextAddress);
	}
	
	// bind on the /model/address parameter (view patch) or return (model patch)
	if (contextAddress != kTTAdrsEmpty) {
		
		absoluteAddress = contextAddress->appendAddress(x->address);
		x->wrappedObject->setAttributeValue(kTTSym_address, x->address);
		
		makeInternals_receiver(x, contextAddress, TT("/model/address"), gensym("return_model_address"), &anObject);
		anObject->sendMessage(kTTSym_Get);
	}
	
	// while the context node is not registered : try to binds again :(
	// (to -- this is not a good way todo. For binding we should make a subscription 
	// to a notification mechanism and each time an TTObjet subscribes to the namespace
	// using jamoma_subscriber_create we notify all the externals which have used 
	// jamoma_subscriber_create with NULL object to bind)
	else {
		
		// release the subscriber
		TTObjectRelease(TTObjectHandle(&x->subscriberObject));
		x->subscriberObject = NULL;
		
		// The following must be deferred because we have to interrogate our box,
		// and our box is not yet valid until we have finished instantiating the object.
		// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
		defer_low((ObjectPtr)x, (method)nmspc_subscribe, NULL, 0, 0);
	}
}

void nmspc_return_model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTNodeAddressPtr			absoluteAddress;
	
	if (argc && argv) {
		
		// set address attribute of the wrapped Receiver object
		absoluteAddress = TTADRS(atom_getsym(argv)->s_name)->appendAddress(x->address);
		x->wrappedObject->setAttributeValue(kTTSym_address, absoluteAddress);
		x->wrappedObject->sendMessage(TT("Explore"));
	}
}

void nmspc_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue		v;
	TTSymbolPtr	output;
	TTNodeAddressPtr address;
	SymbolPtr	s;
	Atom		a[1], c[2];
	
	// Ask Explorer object
	x->wrappedObject->getAttributeValue(TT("output"), v);
	v.get(0, &output);
	
	x->wrappedObject->getAttributeValue(kTTSym_address, v);
	v.get(0, &address);
	
	// UMENU OR UMENU_PREFIX FORMAT
	if (x->msg == gensym("umenu") || x->msg == gensym("umenu_prefix")) {
		
		// clear menu
		outlet_anything(x->outlets[data_out], _sym_clear, 0, NULL);

		// prepare umenu prefix to be concatenated
		if (x->msg == gensym("umenu_prefix")) {
			
			atom_setlong(a, 0);
			outlet_anything(x->outlets[data_out], gensym("prefix_mode"), 1, a);
			
			// prepare umenu prefix 
			if (address->getName() == S_SEPARATOR)
				atom_setsym(a, gensym((char*)address->getCString()));
			else {
				TTString prefix = address->getCString();
				
				if(output == kTTSym_children)
					prefix += "/";
				else if(output == kTTSym_brothers)
					prefix += ".";
				else if(output == kTTSym_attributes)
					prefix += ":";
				else
					prefix += "/";
				
				atom_setsym(a, gensym((char*)prefix.data()));
			}
			
			outlet_anything(x->outlets[data_out], gensym("prefix"), 1, a);
		}
		
		// fill umenu
		// output argv
		for (long i=0; i<argc; i++) {
			s = atom_getsym(argv+i);
			
			if(output == kTTSym_attributes)
				s = jamoma_TTName_To_MaxName(TT(s->s_name));
			
			if (output == kTTSym_brothers && s == _sym_nothing)
				s = gensym("_");
			
			if (s) {
				atom_setsym(a, s);
				outlet_anything(x->outlets[data_out], _sym_append, 1, a);
			}
		}
	}
	
	// JIT CELLBLOCK FORMAT
	if (x->msg == gensym("jit.cellblock")) {
		object_error((ObjectPtr)x, "sorry the jit.cellblock format is not available");
		return;
	}
	
	// COLL FORMAT
	if (x->msg == gensym("coll")) {
		
		// clear coll
		outlet_anything(x->outlets[data_out], _sym_clear, 0, NULL);
		
		// fill coll
		// output argv
		for (long i=0; i<argc; i++) {
			s = atom_getsym(argv+i);
			
			if (output == kTTSym_attributes)
				s = jamoma_TTName_To_MaxName(TT(s->s_name));
			
			if (output == kTTSym_brothers && s == _sym_nothing)
				s = gensym("_");
			
			if (s) {
				atom_setlong(c, i+1);
				atom_setsym(c+1, s);
				outlet_anything(x->outlets[data_out], _sym_store, 2, c);
			}
		}
	}
	
	// NO FORMAT
	if (x->msg == gensym("none") || x->msg == _sym_nothing) {
		if (argc)
			outlet_atoms(x->outlets[data_out], argc, argv);
		else if (msg != _sym_nothing)
			outlet_anything(x->outlets[data_out], msg, argc, argv);
	}
	
	// output the size of the result after the result
	atom_setlong(a, argc);
	outlet_anything(x->outlets[size_out], _sym_int, 1, a);
}

void nmspc_bang(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// UMENU OR UMENU_PREFIX FORMAT : clear umenu
	if (x->msg == gensym("umenu") || x->msg == gensym("umenu_prefix"))
		outlet_anything(x->outlets[data_out], _sym_clear, 0, NULL);

	x->wrappedObject->sendMessage(TT("Explore"));
}

void nmspc_symbol(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue		v;
	TTNodeAddressPtr absoluteAddress;
	
	// for absolute address
	if (TTADRS(msg->s_name)->getType() == kAddressAbsolute) {
		v.append(TTADRS(nmspc_filter_underscore_instance(msg)->s_name));
	}
	else {
		
		// if the relative attribute is on
		if (x->index) {
			absoluteAddress = x->patcherAddress->appendAddress(TTADRS(nmspc_filter_underscore_instance(msg)->s_name));
			v.append(absoluteAddress);
		}
		else {
			object_error((ObjectPtr)x, "set relative attribute on before to send relative address");
			return;
		}
	}
	
	x->wrappedObject->setAttributeValue(kTTSym_address, v);
	
	// UMENU OR UMENU_PREFIX FORMAT : clear umenu
	if (x->msg == gensym("umenu") || x->msg == gensym("umenu_prefix"))
		outlet_anything(x->outlets[data_out], _sym_clear, 0, NULL);
	
	x->wrappedObject->sendMessage(TT("Explore"));
}

void nmspc_write(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	defer(self, (method)nmspc_dowrite, msg, argc, argv);
}

void nmspc_dowrite(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	char 			filename[MAX_FILENAME_CHARS];
	TTSymbolPtr		fullpath;
	TTValue			o, v;
	TTOpmlHandlerPtr aOpmlHandler;
	TTErr			tterr;
	
	if (x->wrappedObject) {
		
		// Default XML File Name
		snprintf(filename, MAX_FILENAME_CHARS, "namespace.opml");
		fullpath = jamoma_file_write((ObjectPtr)x, argc, argv, filename);
		v.append(fullpath);
		
		tterr = x->internals->lookup(TT("OpmlHandler"), o);
		
		if (!tterr) {
			o.get(0, (TTPtr*)&aOpmlHandler);
			
			critical_enter(0);
			tterr = aOpmlHandler->sendMessage(TT("Write"), v, kTTValNONE);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_write, argc, argv);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
}


/*
void nmspc_add_max_namespace(t_nmspc *x)
{
	t_object *patcher;
	t_max_err err;
	long result = 0;

	err = object_obex_lookup(x, gensym("#P"), &patcher);

	object_method(patcher, gensym("iterate"), nmspc_myobject_iterator, (void *)x, PI_WANTBOX | PI_DEEP, &result);
}

long nmspc_myobject_iterator(t_nmspc *x, t_object *b)
{
	TTNodePtr newTTNode;
	bool newInstanceCreated;
	char temp[256];
    t_symbol *varname = object_attr_getsym(b, gensym("varname"));
	uint i;

	// Make sure we are dealing with valid OSC input by looking for a leading slash
	if(varname){
		if(varname->s_name[0] == C_SEPARATOR){
			newInstanceCreated = false;
			
			// put all scripting name in a /max node
			snprintf(temp,256,"/max%s", varname->s_name);
			
			// search for [ and ] cause this is how max declare instance. 
			for(i=0; i<strlen(temp); i++){
				if(temp[i] == '[')
					temp[i] = '.';
				else if(temp[i] == ']')
					temp[i] = 0;
			}

			jamoma_directory_register(gensym(temp), gensym("maxobject"), (t_object *)b, &newTTNode, &newInstanceCreated);

			// add varname and maxclass as properties of the node
			//TODO : max_node_attribute_add(newTTNode,gensym("varname"), b);
			//TODO : max_node_attribute_add(newTTNode,gensym("maxclass"), b);

			//if(newInstanceCreated)
			//	object_warn((t_object *)x,"%s : this scripting name is already registered in the tree", varname->s_name);
		}
	}

    return 0;
}
 */

t_max_err nmspc_get_format(TTPtr self, TTPtr attr, AtomCount *ac, AtomPtr *av)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if ((*ac)&&(*av)) {
		//memory passed in, use it
	} else {
		//otherwise allocate memory
		*ac = 1;
		if (!(*av = (AtomPtr)getbytes(sizeof(Atom)*(*ac)))) {
			*ac = 0;
			return MAX_ERR_OUT_OF_MEM;
		}
	}
	
	atom_setsym(*av, x->msg);
	
	return MAX_ERR_NONE;
}

t_max_err nmspc_set_format(TTPtr self, TTPtr attr, AtomCount ac, AtomPtr av) 
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (ac&&av) {
		x->msg = atom_getsym(av);
	} else {
		// no args, set to none
		x->msg = _sym_none;
	}
	return MAX_ERR_NONE;
}


t_max_err nmspc_get_relative(TTPtr self, TTPtr attr, AtomCount *ac, AtomPtr *av)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if ((*ac)&&(*av)) {
		//memory passed in, use it
	} else {
		//otherwise allocate memory
		*ac = 1;
		if (!(*av = (AtomPtr)getbytes(sizeof(Atom)*(*ac)))) {
			*ac = 0;
			return MAX_ERR_OUT_OF_MEM;
		}
	}
	
	atom_setlong(*av, x->index);
	
	return MAX_ERR_NONE;
}

t_max_err nmspc_set_relative(TTPtr self, TTPtr attr, AtomCount ac, AtomPtr av) 
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (ac&&av) {
		x->index = atom_getlong(av);
		
		if (x->index) {
			// The following must be deferred because we have to interrogate our box,
			// and our box is not yet valid until we have finished instantiating the object.
			// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
			defer_low((ObjectPtr)x, (method)nmspc_subscribe, NULL, 0, 0);
		}
		
	} else {
		// no args
		x->index = 0;
	}
	return MAX_ERR_NONE;
}

SymbolPtr nmspc_filter_underscore_instance(SymbolPtr a)
{
	SymbolPtr b;
	TTString toParse = a->s_name;
	
	//post("before parsing : %s", a->s_name);
	int foundDot = toParse.find_last_of('.');
	int foundUnd = toParse.find_last_of('_');
	
	//post("toParse : %d", toParse.size());
	//post("foundDot : %d", foundDot);
	//post("foundUnd : %d", foundUnd);
	
	if (foundUnd == (foundDot+1)) {
		
		if (foundDot > 0 && foundUnd > 0) {
			
			TTString parsed = toParse.substr(0,foundDot);
			if (foundUnd+1 < (int)toParse.size())
				parsed += toParse.substr(foundUnd+1);
			
			b = gensym((char*)parsed.data());
		}
		else
			b = a;
	}
	else
		b = a;
	
	//post("after parsing : %s", b->s_name);
	return b;
}
