pragma solidity ^0.4.16;

contract SingleHouseFactory {
  mapping(address => SingleHouse) houses;

  function SingleHouseFactory() {}

  function createSingleHouse(address _accountAddress) public returns (address houseAddress) {
    SingleHouse _singleHouse = new SingleHouse(_accountAddress);
    houses[_accountAddress] = _singleHouse;
    return _singleHouse;
  }

  function getSingleHouseAddress(address _accountAddress) public constant returns (address houseAddress) {
    return houses[_accountAddress];
  }
}

contract SingleHouse {
  address accountAddress;

  function SingleHouse(address _accountAddress) {
    accountAddress = _accountAddress;
  }

  function test() constant returns (uint) {
    return 1337;
  }

  function getAccountAddress() constant returns (address) {
    return accountAddress;
  }

}
