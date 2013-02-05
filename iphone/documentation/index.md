# Ti.TestFlight Module

## Description

Provides access to TestFlight's SDK.

## Getting Started

View the [Using Titanium Modules](http://docs.appcelerator.com/titanium/latest/#!/guide/Using_Titanium_Modules) document for instructions on getting
started with using this module in your application.

## Accessing the Ti.TestFlight Module

To access this module from JavaScript, you would do the following:

	var TestFlight = require("ti.testflight");

## Methods

### void takeOff(string teamToken)
Starts a TestFlight session.

### void addCustomEnvironmentInformation(string key, string information)
Add custom environment information. If you want to track custom information such as a user name from your application you can add it here.

### void setOptions(dictionary options)
Sets custom options for the session. Any of the following may be set (default values shown):

	var options = {
		reinstallCrashHandlers: false, // Reinstalls crash handlers from other third party frameworks.
		logToConsole: true, // Sends log statements to Apple System Log and TestFlight log.
		logToSTDERR: true, // Sends log statements to STDERR when debugger is attached.
		sendLogOnlyOnCrash: false // Sends log statements to TestFlight at the end of every session.
	};

### void passCheckpoint(string checkpointName)
Track when a user has passed a checkpoint after the flight has taken off. Eg. passed level 1, posted high score.

### void openFeedbackView()
Opens a feedback window that is not attached to a checkpoint.

### submitFeedback(string feedback)
Submits custom feedback to the site. Sends the data in feedback to the site. This is to be used as the method to submit feedback from custom feedback forms.

## Usage
See example.

## Author
Dawson Toth

## Module History
View the [change log](changelog.html) for this module.

## Feedback and Support
Please direct all questions, feedback, and concerns to [info@appcelerator.com](mailto:info@appcelerator.com?subject=iOS%20TestFlight%20Module).

## License
Copyright(c) 2010-2013 by Appcelerator, Inc. All Rights Reserved. Please see the LICENSE file included in the distribution for further details.