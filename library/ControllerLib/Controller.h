/*
 *
 *  Created by Laurent Garnier on 03/06/09.
 *  Copyright 2009 __BlueYeti/LaBRI__. All rights reserved.
 *
 */

/*!
 * \class Controller
 * \author Laurent Garnier (BlueYeti/LaBRI)
 * \date 03/06/09
 *
 * The Controller is a network plugin manager.
 * It is totally independant. It can be used in other communication applications.
 * It is compiled in a library called libController.a that can be added in a project.
 *
 * In the sequencer it establishes the communication between the engine and devices detected on the network.
 * It create the good link and use the good plugin according to the device communication protocol.
 * It select the good plugin to use with the device name
 *
 */

#ifndef _CONTROLLER_H_
#define _CONTROLLER_H_

#include <map>
#include <vector>
#include <string>
#include <iostream>

#define REQUEST_NOT_SENT -2
#define TIMEOUT_EXCEEDED -1
#define NO_ANSWER 0
#define ANSWER_RECEIVED 1

// TODO : put those string in a global symbol cache table used by the Controller
#define NAMESPACE_ATTR_NONE ""					//< 
#define NAMESPACE_ATTR_ACCESS "access"			//< 
#define NAMESPACE_ATTR_VALUE "value"			//< 
#define NAMESPACE_ATTR_TYPE "type"				//< 
#define NAMESPACE_ATTR_PRIORITY "priority"		//<
#define NAMESPACE_ATTR_RANGE "range"			//< 
#define NAMESPACE_ATTR_COMMENT "comment"		//< 

using namespace std;

class Namespace;
class Device;
class Plugin;
class PluginFactories;

typedef std::string Address;										// at the Controller level, an Address should be like this  : /<nodeName>/.../<nodeName>
typedef Address* AddressPtr;										// !!! DO NOT INCLUDE THE DEVICE NAME AS A ROOT LEVEL !!!
																	// TODO : a class Address (containing the attribute part too and method to parse string in /parent/node.instance:attribute)

typedef std::string Value;											// any kind of data : bool, int, float, array, list, enum, ...
typedef Value* ValuePtr;											// TODO : a class like TTValue

class Controller{
	
private:
	
	std::string m_application_name;									//< the name of the application in wich the Controller is called
	
	PluginFactories *factories;										//< the plugin factories
	
	std::map<std::string, Plugin*> *netPlugins;						//< a map between a plugin name and an instance of this Plugin
	std::map<std::string, Device*> *netDevices;						//< a map between a device name and an instance of this Device
	unsigned int deviceId;											//< the device id witch is incremented automatically 
	
	Namespace* m_namespace;											//< a pointer on the local namespace
	
	void (*m_waitedMessageAction)(void*, 
								  std::string);						//< a callback used when a message is received
	void* m_waitedMessageActionArgument;							//< argument for the callback method
	
	void (*m_discover_callback)(void*, 
								Address, 
								std::vector<std::string>&, 
								std::vector<std::string>&);			//< a callback used when a device wants to dicover the namespace
	void* m_discover_arguments;										//< arguments for the discover callback method
	
	void (*m_get_callback)(void*, 
						   Address, 
						   std::string, 
						   Value&);									//< a callback used when a device wants to get a value from the namespace
	void* m_get_arguments;											//< arguments for the get callback method
	
	void (*m_set_callback)(void*, 
						   Address, 
						   std::string, 
						   Value&);									//< a callback used when a device wants to set a value of the namespace
	void* m_set_arguments;											//< arguments for the set callback method
	
	void(*m_link_callback)(void*,
						   std::string,
						   Address,
						   std::string);							//< a callback used when a device wants to be notified when something changed in the namespace
	void* m_link_arguments;											//< arguments for the link callback method
	
	void (*m_unlink_callback)(void*,
							  std::string,
							  Address,
							  std::string);							//< a callback used when a device wants to stop the notification
	void* m_unlink_arguments;										//< arguments for the unlink callback method
	
public:
	
	/************************************************
	 CONTROLLER METHODS :
	 a set of methods used to handle Controller.
	 ************************************************/
	
	/*!
	 * Default constructor.
	 */
	Controller(std::string aName);
	
	/*!
	 * Destructor.
	 */
	~Controller();
	
	/*!
	 * Add a message reception callback method
	 *
	 */
	void addWaitedMessageAction(void* arg, void(*pt2Func)(void*, std::string));
	
	/*!
	 * The message callback method
	 *
	 */
	friend void waitedMessageCallback(void *, std::string);
	
	
	/************************************************
	 PLUGINS METHODS :
	 a set of methods used to manage plugins.
	 note : each method of this set is prepend by 'plugin'
	 ************************************************/
	
	/*!
	 * Load the plugins available in the plugin directory and instanciates them.
	 *
	 * \param path : the Plugin directory path.
	 */
	void pluginLoad(std::string path);
	
	/*!
	 * 
	 * \return the list of loaded plugin names
	 */
	std::vector<std::string> pluginGetLoadedByName();
	
	/*!
	 * Get a plugin parameter value
	 * 
	 * \return the value for parameter "parameterName" according to the pluginName
	 */
	std::string pluginGetCommParameter(std::string pluginName, std::string parameterName);				// to -- This should be done on a device ...
	
	/*!
	 * Is a plugin loaded ?
	 *
	 * \return true if the plugin exists
	 */
	bool pluginIsLoaded(std::string pluginName);
	

	
	/************************************************
	 DEVICES METHODS :
	 a set of methods used to manage devices
	 note : each method of this set is prepend by 'device'
	 ************************************************/
	
	/*!
	 * Scan the network automatically to detect devices using the appropriate plugin.
	 * This method full the netDevices map.
	 */
	void deviceSetCurrent();
	
	/*!
	 * Possible access to the netDevices map
	 *
	 * \return the netDevices map.
	 */
	std::map<std::string, Device*> *deviceGetCurrent();
	
	/*!
	 * Access to a Devices giving a name
	 *
	 * \return the netDevices map.
	 */
	Device* deviceGet(std::string deviceName);
	
	/*!
	 * Add one device manually according to the genericity of the different plugins parameters
	 *
	 * \param deviceName : the device name to add like this : /<deviceName> .
	 * \param pluginToUse : the plugin name to use which has to be the same string of the plugin name given by his developper. ("OSC", "Minuit", ...)
	 * \param commParameters : a map containing couples <parameterName, parameterValue> to communicate according to the plugin 
	 *
	 * \return 0 if the device is added, -1 if deviceName already exist or if pluginToUse doesn't exist
	 */
	int deviceAdd(std::string deviceName, std::string pluginToUse, std::map<std::string, std::string> *commParameters);
	
	/*!
	 * Remove a device in the netDevices map using the device name 
	 */
	void deviceRemove(std::string deviceName);
	
	/*!
	 * Let to know if the specific plugin used by the device is able to answer to a namespace request
	 *
	 * \return true if the plugin need or false if not
	 */
	bool deviceUnderstandNamespaceRequest(std::string deviceName);
	
	/*!
	 * Send a message to the specific device
	 *
	 * \param address : the address where to send the value (send nothing would be like an event)
	 * \param value : an optionnal value to send
	 */
	void deviceSendMessage(std::string deviceName, Address address, Value& value);
	
	/*!
	 * Send a namespace request to get a part of the namespace at the address
	 *
	 * \param address : the address where to get the snapshot.
	 * \param nodes : the vector which is going to be full with the node names of the namespace
	 * \param attributs : the vector which is going to be full with the attributs names of the namespace
	 * \return the reception state : TIMEOUT_EXCEEDED ; NO_ANSWER ; ANSWER_RECEIVED
	 */
	int deviceSendNamespaceRequest(std::string deviceName, Address address, vector<string>* returnedNodes, vector<string>* returnedAttributes);
	
	/*!
	 * Send a get request to a device to get values at the given address
	 *
	 * \param address : the address where to get the value.
	 * \param attributs : the Value which is going to be full
	 * \return the reception state : TIMEOUT_EXCEEDED ; NO_ANSWER ; ANSWER_RECEIVED
	 */
	int deviceSendGetRequest(std::string deviceName, Address address, Value* returnedValue);
	
	/*!
	 * Get a snapshot (total namespace) of a device using the given address 
	 *
	 * \param address : the address to get the snapshot.
	 * \return a vector containing the snapshot
	 */
	// TODO : return a map of <Address, Value>
	std::vector<std::string> deviceSnapshot(std::string deviceName, Address address);
	
	/*!
	 * Let to know if a device has to be visible in the UI. 
	 * In other words if it could be used by the user or only for an internal communication.
	 *
	 * \param deviceName : the device name.
	 * \return true if the device is visible in the UI.
	 */
	bool deviceIsVisible(std::string deviceName);

	
	
	/************************************************
	 NAMESPACE METHODS :
	 a set of methods used to manage and deal with the local namespace 
	 note : each method of this set is prepend by 'namespace'
	 ************************************************/
	
	/*!
	 * Get the name of the application
	 *
	 * \return the name of the application
	 */
	std::string namespaceApplicationName();
	
	/*!
	 * Add a discover callback method
	 *
	 * \param arg : anything needs by the application to discover his namespace
	 * \param pt2Func : a callback method given by the application to discover his namespace
	 */
	void namespaceDiscoverAddCallback(void* arg, void(*pt2Func)(void*, Address, std::vector<std::string>&, std::vector<std::string>&));
	
	/*!
	 * Discover the namespace at an address.
	 *
	 * \param whereToDiscover : address where to discover the namespace below
	 * \param returnedNodes : nodes below the address
	 * \param returnedAttributes : attribute of the address
	 */
	void namespaceDiscover(Address whereToDiscover, std::vector<std::string>& returnedNodes, std::vector<std::string>& returnedAttributes);
	
	/*!
	 * Add a get callback method
	 *
	 * \param arg : anything needs by the application to get values
	 * \param pt2Func : a callback method given by the application to get values
	 */
	void namespaceGetAddCallback(void* arg, void(*pt2Func)(void*, Address, std::string, Value&));
	
	/*!
	 * Get the value of an attribute at an address.
	 *
	 * \param whereToGet : address where to get an attribute value
	 * \param attribute : attribute to get a value
	 * \param returnedValue :  the value of the attribute
	 */
	void namespaceGet(Address whereToGet, std::string attribute, Value& returnedValue);
	
	/*!
	 * Add a set callback method
	 *
	 * \param arg : anything needs by the application to set incoming values
	 * \param pt2Func : a callback method given by the application to set incoming values
	 */
	void namespaceSetAddCallback(void* arg, void(*pt2Func)(void*, Address, std::string, Value&));
	
	/*!
	 * Set the value of an attribute at an address.
	 *
	 * \param whereToSet : address where to set an attribute value
	 * \param attribute : attribute to set a value
	 * \param newValue : value to pass
	 */
	void namespaceSet(Address whereToSet, std::string attribute, Value& newValue);
	
	/*!
	 * Add a link callback method
	 * 
	 * \param arg : anything needs by the application to create a new listener
	 * \param pt2Func : a callback method given by the application to create a listener (returns a pointer to the new listener to remove it later)
	 */
	void namespaceLinkAddCallback(void* arg, void(*pt2Func)(void*, std::string, Address, std::string));
	
	/*!
	 * Observe for notification when something changes at the address.
	 * Notifications will be sent to a device
	 *
	 * \param whereToSend : device where to send notification
	 * \param whereToObserve : address where to observe 
	 * \param attributeToObserve : the attribute to observe
	 */
	void namespaceLink(Device* whereToSend, Address whereToObserve, std::string attributeToObserve);
	
	/*!
	 * Add a link callback method
	 *
	 * \param arg : anything needs by the application to remove a listener
	 * \param pt2Func : a callback method given by the application to remove a listener
	 */
	void namespaceUnlinkAddCallback(void* arg, void(*pt2Func)(void*, std::string, Address, std::string));
	
	/*!
	 * Stop sending notifications from an address to a device
	 *
	 * \param whereToSend : device where to send notification
	 * \param whereToObserve : address where to observe 
	 * \param attributeToObserve : the attribute to observe 
	 */
	void namespaceUnlink(Device* whereToSend, Address whereToObserve, std::string attributeToObserve);

};

#endif //_CONTROLLER_H_
