### Smart Contract Structure for Factory Pattern


This collection of smart contracts consists of different parts aiming separate contract code and their factories from the interfaces in contracts which are using them. With this structure we avoid massive and in the end undeployable contracts.

##### _contract_ **Main**
Holds the main logic and interacts with the actual contract instances.

##### _contract_ **ChildFactoryInterface**
Provides an interface to the **ChildFactory** contract and enables the **Main** contract to create instances of the **Child** contract.

##### _contract_ **ChildInterface**
Provides an interface to the **Child** contract and enables the **Main** contract to access the functions inside the **Child** instances.

##### _contract_ **Child**
The actual child code is here.

##### _contract_ **ChildFactory**
Creates instances of the **Child** contract and stores its addresses.
