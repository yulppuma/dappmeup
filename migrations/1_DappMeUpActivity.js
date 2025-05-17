const DappMeUpActivity = artifacts.require("./DappMeUpActivity.sol");

module.exports = async function (deployer) {
  await deployer.deploy(DappMeUpActivity);
  let dappMeUpActivityInstance = await DappMeUpActivity.deployed();
  console.log(dappMeUpActivityInstance.address);
};