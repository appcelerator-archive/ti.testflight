/**
 * Ti.Testflight Module
 * Copyright (c) 2010-2013 by Appcelerator, Inc. All Rights Reserved.
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiTestflightModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiTestflightModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"18cc0e74-f50f-4718-a7fe-7a29b19838b8";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.testflight";
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Public API
/**
 * Starts a TestFlight session
 *
 * @param teamToken Will be your team token obtained from https://testflightapp.com/dashboard/team/edit/ 
 */
-(void)takeOff:(id)teamToken
{
    ENSURE_SINGLE_ARG(teamToken, NSString);
    [TestFlight takeOff:teamToken];
    
    // TODO: provide option to exclude this next call (needs to be compile time)
    [TestFlight setDeviceIdentifier:[[UIDevice currentDevice] uniqueIdentifier]];
}

/**
 * Add custom environment information
 * If you want to track custom information such as a user name from your application you can add it here
 * 
 * @param information A string containing the environment you are storing
 * @param key The key to store the information with
 */
-(void)addCustomEnvironmentInformation:(id)args
{
    NSString* key;
    NSString* information;
    ENSURE_ARG_COUNT(args, 2);
    ENSURE_ARG_AT_INDEX(key, args, 0, NSString);
    ENSURE_ARG_AT_INDEX(information, args, 1, NSString);
    [TestFlight addCustomEnvironmentInformation:information forKey:key];
}


/**
 * Sets custom options
 *
 * @param options NSDictionary containing the options you want to set available options are described below
 *
 *   Option                      Accepted Values                 Description
 *   reinstallCrashHandlers      [ NSNumber numberWithBool:YES ] Reinstalls crash handlers, to be used if a third party 
 *                                                               library installs crash handlers overtop of the TestFlight Crash Handlers
 *   logToConsole                [ NSNumber numberWithBool:YES ] YES - default, sends log statements to Apple System Log and TestFlight log 
 *                                                               NO  - sends log statements to TestFlight log only
 *   logToSTDERR                 [ NSNumber numberWithBool:YES ] YES - default, sends log statements to STDERR when debugger is attached
 *                                                               NO  - sends log statements to TestFlight log only
 *   sendLogOnlyOnCrash          [ NSNumber numberWithBool:YES ] NO  - default, sends logs to TestFlight at the end of every session
 *                                                               YES - sends logs statements to TestFlight only if there was a crash
 */
-(void)setOptions:(id)options
{
    ENSURE_SINGLE_ARG(options, NSDictionary);
    [TestFlight setOptions:options];
}

/**
 * Track when a user has passed a checkpoint after the flight has taken off. Eg. passed level 1, posted high score
 *
 * @param checkpointName The name of the checkpoint, this should be a static string
 */
-(void)passCheckpoint:(id)checkpointName
{
    ENSURE_SINGLE_ARG(checkpointName, NSString);
    [TestFlight passCheckpoint:checkpointName];
}

/**
 * Opens a feedback window that is not attached to a checkpoint
 */
-(void)openFeedbackView:(id)args
{
    ENSURE_UI_THREAD(openFeedbackView, args);
    [TestFlight openFeedbackView];
}

/**
 * Submits custom feedback to the site. Sends the data in feedback to the site. This is to be used as the method to submit
 * feedback from custom feedback forms.
 *
 * @param feedback Your users feedback, method does nothing if feedback is nil
 */
-(void)submitFeedback:(id)feedback
{
    ENSURE_SINGLE_ARG(feedback, NSString);
    [TestFlight submitFeedback:feedback];
}


@end
