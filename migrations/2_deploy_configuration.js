var Configuration = artifacts.require("Configuration");
var SingleHouseFactory = artifacts.require("SingleHouseFactory");


module.exports = function(deployer) {
  console.log("migrations deploying...");

  deployer.deploy(SingleHouseFactory).then(function() {
    console.log("SingleHouseFactory ADDRESS: " + SingleHouseFactory.address);
    return deployer.deploy(Configuration, SingleHouseFactory.address).then(function() {
      console.log("Configuration ADDRESS: " + Configuration.address);
    });
  });

};
