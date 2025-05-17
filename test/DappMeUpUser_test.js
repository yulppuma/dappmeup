const DappMeUpUser = artifacts.require("./DappMeUpUser.sol");
const assert = require('assert');

contract('DappMeUpUser', (accounts) =>{
    let dappMeUpUserContract;
    const USER = accounts[0];
    
    //create instance of deployed contracts
    before(async() => {
        dappMeUpUserContract = await DappMeUpUser.deployed();
    });

    it ('should create a new user', async() => {
        let userName = "Yul";
        console.log("Total users before: " + await dappMeUpUserContract.totalUsers() + "\n");
        await dappMeUpUserContract.createUser(USER, userName);
        console.log("Total users after: " + await dappMeUpUserContract.totalUsers() + "\n");
        const myNewUser = await dappMeUpUserContract.findUser(USER);
        assert.equal(myNewUser.name, userName, 'user should now be created.');
    });
});