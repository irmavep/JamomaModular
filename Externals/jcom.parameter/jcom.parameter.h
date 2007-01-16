/* 
 * jcom.param
 * External for Jamoma: parameter definition using pattr
 * By Tim Place, Copyright � 2006
 * 
 * License: This code is licensed under the terms of the GNU LGPL
 * http://www.gnu.org/licenses/lgpl.html 
 */

#ifndef __JMOD_PARAM_H__
#define __JMOD_PARAM_H__

#include "ext.h"				// Max Header
#include "ext_obex.h"			// Max Object Extensions (attributes) Header
#include "commonsyms.h"			// Common symbols used by the Max 4.5 API

#ifdef JMOD_MESSAGE
#define OBJECT_CLASS_NAME "jcom.message"
#else
#define OBJECT_CLASS_NAME "jcom.parameter"
#endif

#include "jcom.core.h"			// OBJECT_CLASS_NAME must defined before this

// Ramp Unit interfaces
#include "rampunit.h"
#include "ramplib.linear.max.h"
#include "ramplib.linear.maxq.h"
#include "ramplib.none.h"

#define LISTSIZE 512

enum outlets{
	k_outlet_set = 0,
	k_outlet_direct,
	k_outlet_dumpout,
	num_outlets
};
			
typedef void (*pf_noargs)(void *x);			// pointer to a function with only the struct pointer given
											// must be defined so the struct will know what to do, but can't define it as requiring the struct
#define attr_value	atom_list[0]

typedef struct _param{						// Data Structure for this object
	t_object				ob;						// REQUIRED: Our object
	void					*obex;					// REQUIRED: Object Extensions used by Jitter/Attribute stuff
	pf_noargs				param_bang;				// bang method for the instance points to an optimized function
	t_patcher				*container;
	void					*hub;					// the jcom.hub object to which we subscribe
	void 					*outlets[num_outlets];	// my outlet array
	t_atom					atom_list[LISTSIZE];	// was "t_atom attr_value;"	// ATTRIBUTE: The parameter's value
	long					list_size;
	t_symbol				*attr_name;				// ATTRIBUTE: parameter's name
	t_symbol				*attr_clipmode;			// ATTRIBUTE: how to constrain values to the specified ranges
	t_symbol				*attr_description;		// ATTRIBUTE: textual description of this parameter
	t_symbol				*attr_ramp;				// ATTRIBUTE: ramp mode 
	float					attr_range[2];			// ATTRIBUTE: low, high
	long					attr_range_len;			//		length actually given to us by the user
	long					attr_repetitions;		// ATTRIBUTE: 0 = filter out repetitions (like the change object)
	long					attr_slavemode;			// ATTRIBUTE: This instance is a slave of another instance, and simply forward anything recieved
	long					attr_ui_freeze;
	float					attr_stepsize;			// ATTRIBUTE: amount to increment or decrement by
	t_symbol				*attr_type;				// ATTRIBUTE: what kind of data doers this object define?
	long					attr_priority;			// ATTRIBUTE: does this parameter have a priority over other parameters when a preset is recalled?
	t_symbol				*name;					// the first arg is the name of the parameter, which is stored by pattr - but we cache it here too...
	t_atom					name_atom;				// the above name, but cached as an atom for quick referencing
	t_symbol				*module_name;			// the name of the module as reported when we subscribe to jcom.hub
	t_rampunit_functions	*rampfunction;			// function pointers for this objects rampunit interface
	void					*rampunit;				// a pointer to our ramp unit data structure
	void					*ui_qelem;				// the output to the connected ui object is "qlim'd" with this qelem
} t_param;


// Prototypes
// Defined in jcom.parameter.c
void		*param_new(t_symbol *s, long argc, t_atom *argv);
void		param_free(t_param *x);
void 		param_release(t_param *x);									// Hub Deletion
void		param_assist(t_param *x, void *b, long msg, long arg, char *dst);
void		param_dump(t_param *x);
void		param_userbang(t_param *x);
//void		param_bang(t_param *x);	
void 		param_bang_int(void *z);		// one of these is called from the bang method pointer in our struct...
void 		param_bang_float(void *z);
void 		param_bang_symbol(void *z);
void 		param_bang_menu(void *z);
void 		param_bang_generic(void *z);
#ifdef JMOD_MESSAGE
void		param_bang_none(void *z);
#endif // JMOD_MESSAGE
void 		param_inc(t_param *x);
void 		param_dec(t_param *x);
void		param_int(t_param *x, long n);
void		param_float(t_param *x, double f);
void		param_symbol(t_param *x, t_symbol *msg, short argc, t_atom *argv);
void 		param_send_feedback(t_param *x);
void		param_list(t_param *x, t_symbol *msg, short argc, t_atom *argv);
void		param_ramp_callback_float(void *v, float value);
void		param_ramp_callback_int(void *v, float value);
void 		param_subscribe(t_param *x);
void		atom_clip(t_param *x, t_atom *a);
void 		param_dispatched(t_param *x, t_symbol *msg, short argc, t_atom *argv);
t_max_err 	param_settype(t_param *x, void *attr, long argc, t_atom *argv);
t_max_err	param_setramp(t_param *x, void *attr, long argc, t_atom *argv);
void 		param_ramp_setup(t_param *x);
void		param_ui_refresh(t_param *x);
void		param_ui_queuefn(t_param *x);
#ifndef JMOD_MESSAGE
t_max_err 	param_setvalueof(t_param *x, long argc, t_atom *argv);
t_max_err 	param_getvalueof(t_param *x, long *argc, t_atom **argv);
#endif

// Defined in jcom.parameter.clip.c
void 		param_clip_generic(t_param *x);
void 		param_clip_int(t_param *x);
void 		param_clip_float(t_param *x);
void		param_clip_list(t_param *x);

#endif // #ifndef __JMOD_PARAM_H__
