pragma solidity ^0.4.16;

contract SingleHouseFactoryInterface {
  function createSingleHouse(address _accountAddress) returns (address houseAddress) {}
  function getSingleHouseAddress(address _accountAddress) returns (address houseAddress) {}
}
