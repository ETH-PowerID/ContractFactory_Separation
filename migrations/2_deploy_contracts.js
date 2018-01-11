var Main = artifacts.require("Main");
var ChildFactory = artifacts.require("ChildFactory");

module.exports = function(deployer) {
  console.log("migrations deploying...");

  deployer.deploy(ChildFactory).then(function() {
    console.log("ChildFactory ADDRESS: " + ChildFactory.address);
    return deployer.deploy(Main, ChildFactory.address).then(function() {
      console.log("Main ADDRESS: " + Main.address);
    });
  });

};
