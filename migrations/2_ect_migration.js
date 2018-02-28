var EthereumColumbusToken = artifacts.require("./EthereumColumbusToken.sol");

module.exports = function(deployer) {
  deployer.deploy(EthereumColumbusToken);
};
