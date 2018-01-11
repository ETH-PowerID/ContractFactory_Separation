var ChildFactory = artifacts.require("./ChildFactory.sol");
var Main = artifacts.require("./Main.sol");

contract('Child', function(accounts) {
  console.log(accounts);


  Main.deployed().then(function(instance) {
    main = instance;

    return main.addChild();
  }).then(function(result) {
    return main.addChild.call();
  }).then(function(result) {
    console.log("Child Address: " + result);

    return main.addChild();
  }).then(function(result) {
    return main.addChild.call();
  }).then(function(result) {
    console.log("Child Address: " + result);

    return main.test(0);
  }).then(function(result) {
    return main.test.call(0);
  }).then(function(result) {
    console.log("Test result:");
    console.log(result.toNumber());

    return main.test(1);
  }).then(function(result) {
    return main.test.call(1);
  }).then(function(result) {
    console.log("Test result:");
    console.log(result.toNumber());
  });

});
