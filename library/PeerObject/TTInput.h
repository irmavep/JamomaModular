/* 
 * TTObject to handle any signal input
 *
 * Copyright © 2010, Théo de la Hogue
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#ifndef __TT_INPUT_H__
#define __TT_INPUT_H__

#include "TTModular.h"

/** TTInput ... TODO : an explanation
 
 
 */

class TTOutput;
typedef TTOutput* TTOutputPtr;

class TTMODULAR_EXPORT TTInput : public TTDataObject
{
	TTCLASS_SETUP(TTInput)
	
public:	// use public for quick acces during signal processing
	
	TTSymbolPtr			mType;						///< ATTRIBUTE : the type of the input signal (like audio, video, ...)
	TTNodeAddressPtr	mOutputAddress;				///< ATTRIBUTE : address of the output to bind
	
	TTBoolean			mMute;						///< ATTRIBUTE : to mute signal
	TTBoolean			mBypass;					///< ATTRIBUTE : to pass signal directly to a TTOutput object
	
	TTObjectPtr			mSignalIn;					///< any data structure to receive complex signal
	TTListPtr			mSignalCache;				///< a list of any data structure to deal with others complex signals (like mixing, dubbing, ...)
	TTObjectPtr			mSignalOut;					///< any data structure to send complex signal
	
	TTObjectPtr			mSignalZero;				///< a zero signal
	
	TTOutputPtr			mOutputObject;				///< TTOutput object to pass signal through
	
private:

	TTCallbackPtr		mReturnSignalCallback;		///< a way to return back signal to the owner of this input
	TTCallbackPtr		mAddressObserver;			///< to observe mOutputAddress creation/destruction
	
	/** Send signal. The mIndex have to be choosen before */
	TTErr Send(const TTValue& inputValue, TTValue& outputValue);
	
	/** Set outputObject */
	TTErr Link(const TTValue& inputValue, TTValue& outputValue);
	
	/** Remove outputObject */
	TTErr Unlink();
	
	/** Set the outputAddress attribute */
	TTErr setOutputAddress(const TTValue& value);
	
	friend TTErr TTMODULAR_EXPORT TTInputDirectoryCallback(TTPtr baton, TTValue& data);

};

typedef TTInput* TTInputPtr;

/**	
 @param	baton						..
 @param	data						..
 @return							an error code */
TTErr TTMODULAR_EXPORT TTInputDirectoryCallback(TTPtr baton, TTValue& data);


#endif // __TT_INPUT_H__
