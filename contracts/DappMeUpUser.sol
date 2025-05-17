//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./DappMeUpActivity.sol";

contract DappMeUpUser is DappMeUpActivity{

	//This will serve as a way for the user to log in to their DappMeUp account via their e-wallet (i.e. metamask, apex, etc.).
	mapping(address => DMEUser) internal dMEUsers;
	uint256 internal totalUsers = 0;

	enum Status {Online, Offline, Away, DND}

	struct DMEUser{
		address user;
		string name;
		bool userCreated;
		Status status;
		uint256 creationDate;
	}

	//if user wants to make any changes to their account, they must be owner of the respected account.
	modifier IsAUser(){
		require(dMEUsers[msg.sender].userCreated, "User has not been created! Please create user first.");
		_;
	}

	//Default user activity logged.
	function logActivity(ActivityType _activityType) internal override {
		emit LogActivity(msg.sender, _activityType, "New user activity made!");
	}

	//create new user if user logs in and no account is found with their address
	function createUser(address _userAddress,string memory _name) internal {
		require(!dMEUsers[_userAddress].userCreated, "Address already in use by active user!");
		dMEUsers[_userAddress] = DMEUser(_userAddress, _name, true, Status.Online, block.timestamp);
		totalUsers++;
		emit LogActivity(_userAddress, ActivityType.User, string.concat("New user created ", _name));
	}

	//Once user signs in with their Metamask account, they will be asked to set their name on the app.
	function modifyUserName(string memory _name) internal IsAUser(){
		dMEUsers[msg.sender].name = _name;
		emit LogActivity(msg.sender, ActivityType.User, string.concat("User has updated their name ", _name));
	}

	//Changes the status of the user. Since this is a personal feature, it will not be logged (gas prices!!).
	function setStatus(Status _status) internal IsAUser{
		dMEUsers[msg.sender].status = _status;
	}

	//finds a user given a user address as an input and returning the corresponding account
	function findUser (address _user) internal view IsAUser returns(DMEUser memory){
		return dMEUsers[_user];
	}

	//Logged in user can delete their account, in doing so will delete any comments/post tied to their account (TBD).
	function deleteUser() internal IsAUser {
		string memory _name = dMEUsers[msg.sender].name;
		dMEUsers[msg.sender].userCreated = false;

		emit LogActivity(msg.sender, ActivityType.User, string.concat("User deleted: ",_name));
	}
	
	function totalNumOfUsers() internal view IsAUser returns(uint256){
		return totalUsers;
	} 
}