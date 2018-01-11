var SingleHouseFactory = artifacts.require("SingleHouseFactory");
var Configuration = artifacts.require("Configuration");
var SingleHouse = artifacts.require("SingleHouse");

var config = {
  'admin': [
    {
      'accountAddress': 0
    }
  ],

  'house': [
    {
      'accountAddress': 0
    },
    {
      'accountAddress': 0
    }
  ]
}

contract('Configuration', function(accounts) {

  config.admin[0].accountAddress = accounts[0];
  config.house[0].accountAddress = accounts[1];
  config.house[1].accountAddress = accounts[2];

  Configuration.deployed().then(function(instance) {
    configuration = instance;

    // Register house[0], get the contract address and create contract instance at address
    return configuration.addDevice(0, config.house[0].accountAddress);
  }).then(function(result) {
    return configuration.getContractAddress.call(config.house[0].accountAddress);
  }).then(function(result) {
    console.log("SingleHouse Address: " + result);
    config.house[0]['contractAddress'] = result;
    config.house[0]['contract'] = SingleHouse.at(result);

    // Register house[0], get the contract address and create contract instance at address
    return configuration.addDevice(0, config.house[1].accountAddress);
  }).then(function(result) {
    return configuration.getContractAddress.call(config.house[1].accountAddress);
  }).then(function(result) {
    console.log("SingleHouse Address: " + result);
    config.house[1]['contractAddress'] = result;
    config.house[1]['contract'] = SingleHouse.at(result);


    // Log configuration to check
    console.log('\n');
    console.log(config);

    // Call the test() function in configuration -> this function calls the test() of SingleHouse via SingleHouseInterface
    return configuration.test(config.house[0].accountAddress);
  }).then(function(result) {
    return configuration.test.call(config.house[0].accountAddress);
  }).then(function(result) {
    console.log("\nExternal test result:");
    console.log(result.toNumber());

    // Call the test() function in configuration -> this function calls the test() of SingleHouse via SingleHouseInterface
    return configuration.test(config.house[1].accountAddress);
  }).then(function(result) {
    return configuration.test.call(config.house[1].accountAddress);
  }).then(function(result) {
    console.log("External test result:");
    console.log(result.toNumber());

    // Call the getAccountAddress() function in SingleHouse from the agent
    return config.house[0].contract.getAccountAddress.call();
  }).then(function(result) {
    console.log("\nInternal test result:");
    console.log("accountAddress: " + result);

    // Call the getAccountAddress() function in SingleHouse from the agent
    return config.house[1].contract.getAccountAddress.call();
  }).then(function(result) {
    console.log("\nInternal test result:");
    console.log("accountAddress: " + result);


    console.log("\n-----\ndone…\n-----\n");

  });

});
