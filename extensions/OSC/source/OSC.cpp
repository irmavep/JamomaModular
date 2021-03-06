/*
 * The OSC Protocol
 * Copyright © 2013, Théo de la Hogue
 *
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

/*!
 * \class OSC
 *
 * It's the OSC protocol which use the Open Sound Control protocol 
 * 
 */

#include "Protocol.h"
#include "OSC.h"

#define thisTTClass				OSC
#define thisTTClassName			"OSC"
#define thisTTClassTags			"network, protocol, osc"

#define thisProtocolVersion		"0.1"
#define thisProtocolAuthor		"Theo de la Hogue"
#define thisProtocolGet         NO
#define thisProtocolSet         YES
#define thisProtocolListen      NO
#define thisProtocolDiscover	NO

extern "C" TT_EXTENSION_EXPORT TTErr TTLoadJamomaExtension_OSC(void)
{
	TTFoundationInit();
	OSC::registerClass();
	return kTTErrNone;
}

PROTOCOL_CONSTRUCTOR,
mIp(TTSymbol("localhost")),
mPort(OSC_RECEPTION_PORT),
mOscReceive(NULL),
mSenderManager(NULL)
{	
	PROTOCOL_INITIALIZE
	
	addAttribute(Ip, kTypeSymbol);
	addAttribute(Port, kTypeUInt16);
	
	addMessageWithArguments(receivedMessage);
	addMessageProperty(receivedMessage, hidden, YES);
}

OSC::~OSC()
{
    ;
}

TTErr OSC::getParameterNames(TTValue& value)
{
	value.clear();
	value.append(TTSymbol("ip"));
	value.append(TTSymbol("port"));
	
	return kTTErrNone;
}

TTErr OSC::Scan()
{
	// TODO : using Bonjour
	return kTTErrGeneric;
}

/*!
 * Run the arguments reception thread 
 * Prepare the receive callback method to be passed to the ApplicationManager to intercept the arguments
 *
 */
TTErr OSC::Run()
{
	TTErr	err;
	
	if (!mRunning) {
		
        mSenderManager = new OSCSenderManager();
		
		err = TTObjectBaseInstantiate(TTSymbol("osc.receive"), &mOscReceive, kTTValNONE);
		if (!err) {
				mOscReceive->setAttributeValue(TTSymbol("port"), mPort);
				mOscReceive->registerObserverForNotifications(*this);			// using our 'receivedMessage' method
			
			mRunning = YES;
		}
		
		return err;
	}
	
	return kTTErrGeneric;
}

/*!
 * Stop the arguments reception thread 
 *
 */
TTErr OSC::Stop()
{
	if (mRunning) {
		
        delete mSenderManager;
        
		TTObjectBaseRelease(&mOscReceive);
        
		mRunning = NO;
		
		return kTTErrNone;
	}
	
	return kTTErrGeneric;
}

/**************************************************************************************************************************
 *
 *	SEND REQUEST METHODS
 *
 **************************************************************************************************************************/

/*!
 * Send a discover request to an application to get a part of the namespace at the given address
 *
 * \param to					: the application where to discover
 * \param address				: the address to discover
 * \param returnedType          : the type of the node at the address (default is none which means no type)
 * \param returnedChildren      : all names of nodes below the address
 * \param returnedAttributes	: all attributes the node at the address
 * \return errorcode			: kTTErrNone means the answer has been received, kTTErrValueNotFound means something is bad in the request
 else it returns kTTErrGeneric if no answer or timeout
 */
TTErr OSC::SendDiscoverRequest(TTSymbol to, TTAddress address,
                               TTSymbol& returnedType,
                               TTValue& returnedChildren,
                               TTValue& returnedAttributes)
{
	return kTTErrGeneric;
}

/*!
 * Send a get request to an application to get a value at the given address
 *
 * \param to					: the application where to get
 * \param address				: the address to get
 * \param returnedValue			: the value which is going to be filled
 * \return errorcode			: kTTErrNone means the answer has been received, kTTErrValueNotFound means something is bad in the request
 else it returns kTTErrGeneric if no answer or timeout
 */
TTErr OSC::SendGetRequest(TTSymbol to, TTAddress address, 
                          TTValue& returnedValue)
{	
	return kTTErrGeneric;
}

/*!
 * Send a set request to set a value of a specific application
 *
 * \param to					: the application where to set
 * \param address				: the address to set
 * \param value					: anything to send
 * \return errorcode			: kTTErrNone means the answer has been received, kTTErrValueNotFound means something is bad in the request
 */
TTErr OSC::SendSetRequest(TTSymbol to, TTAddress address, 
                          TTValue& value)
{
		
#ifdef TT_PROTOCOL_DEBUG
		std::cout << "OSC : applicationSendSetRequest " << std::endl;
#endif

	if (address.getAttribute() == kTTSym_value)
		return sendMessage(to, address.removeAttribute(), value);
	else
		return sendMessage(to, address, value);
}

/*!
 * Send a listen request to a specific application
 *
 * \param to					: the application where to listen
 * \param address				: the address to listen
 * \param enable				: enable/disable the listening
 * \return errorcode			: kTTErrNone means the answer has been received, kTTErrValueNotFound means something is bad in the request
 */
TTErr OSC::SendListenRequest(TTSymbol to, TTAddress address, 
                             TTBoolean enable)
{
    return kTTErrGeneric;
}


/**************************************************************************************************************************
 *
 *	SEND ANSWER METHODS
 *
 **************************************************************************************************************************/

/*!
 * Send a disover answer to a application which ask for.
 *
 * \param to					: the application where to send answer
 * \param address				: the address where comes from the description
 * \param returnedType          : the type of the node at the address (default is none which means no type)
 * \param returnedChildren      : all names of nodes below the address
 * \param returnedAttributes	: all attributes the node at the address
 */
TTErr OSC::SendDiscoverAnswer(TTSymbol to, TTAddress address,
                         TTSymbol& returnedType,
                         TTValue& returnedChildren,
                         TTValue& returnedAttributes,
                         TTErr err)
{
    return kTTErrGeneric;
}

/*!
 * Send a get answer to an application which ask for.
 *
 * \param to					: the application where to send answer
 * \param address				: the address where comes from the value
 * \param returnedValue			: the value of the attribute at the address
 */
TTErr OSC::SendGetAnswer(TTSymbol to, TTAddress address, 
							TTValue& returnedValue, 
							TTErr err)
{
    return kTTErrGeneric;
}

/*!
 * Send a listen answer to an application which ask for.
 *
 * \param to					: the application where to send answer
 * \param address				: the address where comes from the value
 * \param returnedValue			: the value of the attribute at the address
 */
TTErr OSC::SendListenAnswer(TTSymbol to, TTAddress address, 
							   TTValue& returnedValue, 
							   TTErr err)
{
    return kTTErrGeneric;
}

TTErr OSC::sendMessage(TTSymbol distantApplicationName, TTSymbol header, TTValue& arguments)
{
	TTHashPtr	parameters = NULL;
    TTObjectBasePtr anOscSender;
	TTValue		v, vIp, vPort, message;
	TTErr		err, errIp, errPort;
	
	// Check the application registration
	err = mDistantApplicationParameters->lookup(distantApplicationName, v);
	
	if (!err) {
		parameters = TTHashPtr((TTPtr)v[0]);
		
		if (parameters) {
			
			errIp = parameters->lookup(TTSymbol("ip"), vIp);
			errPort = parameters->lookup(TTSymbol("port"), vPort);
			
			if (errIp || errPort)
				return kTTErrGeneric;
			
			anOscSender = mSenderManager->lookup(distantApplicationName, vIp, vPort);
			if (anOscSender) {

				message = TTValue(header);
				message.append((TTPtr)&arguments);
				
				err = anOscSender->sendMessage(TTSymbol("send"), message, kTTValNONE);
            
				if (mActivity) {
					v = arguments;
					v.prepend(header);
					ActivityOutMessage(v);
				}
			}
		}
	}

	return err;
}

TTErr OSC::receivedMessage(const TTValue& message, TTValue& outputValue)
{
	TTSymbol	aSymbol;
	TTString	headerString;
	TTValue		arguments;
	TTAddress   whereTo = kTTAdrsEmpty;
	
	/*
	 if message starts with '/'
	 */
	
	if (mActivity) ActivityInMessage(message);
	
	aSymbol = message[0];
	headerString = aSymbol.string();
    
#ifdef TT_PROTOCOL_DEBUG
    cout << "Message header is " << aSymbol.c_str() << endl;
#endif
	
	// if message starts with '/'
	if (headerString[0] == '/')
	{
		whereTo = TTAddress(aSymbol.c_str());
		arguments.copyFrom(message, 1);
		
#ifdef TT_PROTOCOL_DEBUG
		cout << "Receive set request at " << whereTo.c_str() << endl;
#endif
		
		return ReceiveSetRequest(kTTSymEmpty, whereTo, arguments);
	} 
		
	return kTTErrGeneric;
}