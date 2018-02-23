var Username = artifacts.require("./Username.sol");
var TokenSale = artifacts.require("./TokenSale.sol");

module.exports = function(deployer) {
  deployer.deploy(username);
  deployer.deploy(tokensale);
};
