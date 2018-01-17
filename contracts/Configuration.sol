pragma solidity ^0.4.16;

import './FactoryInterfaces.sol';
import './SingleHouseInterface.sol';

contract Configuration {
  mapping (address => address) contractList;
  SingleHouseFactoryInterface singleHouseFactory;

  function Configuration(address _singleHouseFactoryAddress) {
    singleHouseFactory = SingleHouseFactoryInterface(_singleHouseFactoryAddress);
  }

  function addDevice(uint8 _deviceType, address _accountAddress) public returns (address singleHouseAddress){
    if (_deviceType == 0) {
      contractList[_accountAddress] = SingleHouseInterface( singleHouseFactory.createSingleHouse(_accountAddress) );
      return contractList[_accountAddress];
    }
  }

  function getContractAddress(address _accountAddress) public constant returns (address contractAddress) {
    return contractList[_accountAddress];
  }

  function test(address _accountAddress) returns (uint) {
    return SingleHouseInterface(contractList[_accountAddress]).test();

    // or maybe like this?
    /* return GeneralDevice(contractList[_accountAddress]).test(); */
  }
}
