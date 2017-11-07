const Casper = artifacts.require('./Casper.sol')

module.exports = (deployer) => {
  deployer.deploy(Casper)
}
