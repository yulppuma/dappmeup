const DappMeUpUser = artifacts.require("./DappMeUpUser.sol");

module.exports = async function (deployer) {
    await deployer.deploy(DappMeUpUser);
    let dappMeUpUserInstance = await DappMeUpUser.deployed();
    console.log(dappMeUpUserInstance.address);
};