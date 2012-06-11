var win = Ti.UI.createWindow({
    backgroundColor: '#fff'
});

var TestFlight = require('ti.testflight');
TestFlight.takeOff('<< YOUR TEAM TOKEN GOES HERE>>'); // https://testflightapp.com/dashboard/team/edit/
TestFlight.addCustomEnvironmentInformation('username', 'dtoth');
TestFlight.setOptions({
    reinstallCrashHandlers: false, // Reinstalls crash handlers from other third party frameworks.
    logToConsole: true, // Sends log statements to Apple System Log and TestFlight log.
    logToSTDERR: true, // Sends log statements to STDERR when debugger is attached.
    sendLogOnlyOnCrash: false // Sends log statements to TestFlight at the end of every session.
});
setTimeout(function () {
    TestFlight.passCheckpoint('5 Seconds After Opened');
}, 5000);

var openFeedbackView = Ti.UI.createButton({
    title: 'Open Feedback View',
    top: 20, right: 20, left: 20,
    height: 50
});
openFeedbackView.addEventListener('click', function () {
    TestFlight.openFeedbackView();
});
win.add(openFeedbackView);

var submitFeedback = Ti.UI.createButton({
    title: 'Submit Feedback',
    top: 90, right: 20, left: 20,
    height: 50
});
submitFeedback.addEventListener('click', function () {
    TestFlight.submitFeedback();
});
win.add(submitFeedback);

win.open();