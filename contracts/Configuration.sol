pragma solidity ^0.4.16;

import './FactoryInterfaces.sol';
import './SingleHouseInterface.sol';

contract Configuration {
  mapping (address => address) contractList;
  mapping (address => SingleHouseInterface) houses;
  SingleHouseFactoryInterface singleHouseFactory;

  function Configuration(address _singleHouseFactoryAddress) {
    singleHouseFactory = SingleHouseFactoryInterface(_singleHouseFactoryAddress);
  }

  function addDevice(uint8 _deviceType, address _accountAddress) public returns (address singleHouseAddress){
    if (_deviceType == 0) {
      address _singleHouseAddress = singleHouseFactory.createSingleHouse(_accountAddress);
      contractList[_accountAddress] = SingleHouseInterface(_singleHouseAddress);
      houses[_accountAddress] = SingleHouseInterface(_singleHouseAddress);
      return _singleHouseAddress;
    }
  }

  function getContractAddress(address _accountAddress) public constant returns (address contractAddress) {
    return contractList[_accountAddress];
  }

  function test(address _accountAddress) returns (uint) {
    return houses[_accountAddress].test();
  }
}
