const DappMeUp = artifacts.require("./DappMeUp.sol");
const DappMeUpUser = artifacts.require("./DappMeUpUser.sol");
const assert = require('assert');

contract('DappMeUp', (accounts) =>{
    let dappMeUpContract, dappMeUpUserContract;
    const USER = accounts[0];
    
    //create instance of deployed contracts
    before(async() => {
        dappMeUpUserContract = await DappMeUpUser.deployed();
        dappMeUpContract = await DappMeUp.deployed();
    });

    describe('when a user is logging in/up', () =>{
        let userName;
        before(async ()=>{
            userName = "John";
            await dappMeUpContract.createUser(userName);
        });

        it ('should create a new user', async() => {
            const myNewUser = await dappMeUpContract.getUser();
            console.log("\nTotal Users after: " + await dappMeUpContract.getTotalUsers() + "\nName: " + myNewUser.name + "\n");
            assert.equal(myNewUser.name, userName, 'user should now be created.');
        });

        it ('should not allow user to create a new user if an account is already created for them', async() => {
            let error;
            try{
                let anotherUser = "John";
                await dappMeUpContract.createUser(anotherUser);
            }
            catch(_error){
                error = _error;
            }
            assert.ok(error, "should throw error for creating another user");
        });
    });
    /*it ('should create a new user', async() => {
        let userName = "John";
        await dappMeUpContract.createUser(userName);
        const myNewUser = await dappMeUpContract.getUser();
        console.log("\nTotal Users after: " + await dappMeUpContract.getTotalUsers() + "\nName: " + myNewUser.name + "\n");
        assert.equal(myNewUser.name, userName, 'user should now be created.');
    });*/
});