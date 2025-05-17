//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/*
	DappMeUpActivity will serve as the base contract for any activity/event made on the main application.
	i.e. If a user is created, event will be logged,
*/

contract DappMeUpActivity{

	//enum for the type of activity being done
	enum ActivityType {User, Post, Comment, Other}

	//event that logs the activity being done (i.e. user's name change, post made, comment added to post, etc.)
	event LogActivity(address indexed sender, ActivityType indexed activityType, string message);

	//logs the activity
	function logActivity(ActivityType _activityType) internal virtual {
		emit LogActivity(msg.sender, _activityType, "New activity made!");
	}
}