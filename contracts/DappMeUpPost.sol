//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./DappMeUpActivity.sol";

contract DappMeUpPost is DappMeUpActivity{

	/*struct DappMeUpPost{
		address owner;
		uint256 id;
		string title;
		string body;
		uint256 timestamp;
	}*/

	//Array of posts made in DappMeUp
	//DappMeUpPost[] internal dappMeUpPosts;
	uint256 public totalPosts = 0;


}