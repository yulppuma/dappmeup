//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./DappMeUpUser.sol";

contract DappMeUp is DappMeUpUser{

	//DappMeUpUser contract instance
	address public dappMeUpUser;

	constructor (address _dappMeUpUser){
		dappMeUpUser = _dappMeUpUser;
	}

	function createUser(string memory _username) external {
		super.createUser(msg.sender, _username);
	}

	function search(ActivityType _activityType, address _userPostComment) external view returns(string memory){
		if (_activityType == ActivityType.User){
			return searchUser(_userPostComment);
		}
		else{
			return "Does not exist";
		}
	}
	
	function getUser() external view returns(DMEUser memory){
		return dMEUsers[msg.sender];
	}


	function searchUser(address _user) private view returns (string memory){
		//address _userAddress = address(bytes20(bytes(_user)));
		return findUser(_user).name;
	}

	function getTotalUsers() external view returns(uint256){
		return totalNumOfUsers();
	}

}