const DappMeUp = artifacts.require("./DappMeUp.sol");
const DappMeUpUser = artifacts.require("./DappMeUpUser.sol");

module.exports = async function (deployer) {
    let dappMeUpUserInstance = await DappMeUpUser.deployed();
    console.log("DappMeUpUser Contract address: " + dappMeUpUserInstance.address);
    await deployer.deploy(DappMeUp, dappMeUpUserInstance.address);
    let dappMeUpInstance = await DappMeUp.deployed();
    console.log("\nDappMeUp Contract Address: " + dappMeUpInstance.address);

};