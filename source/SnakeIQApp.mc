using Toybox.Application;
using Toybox.WatchUi;
using Toybox.System as Sys;

var highScores;
var screenWidth;
var screenHeight;
var center;
class SnakeIQApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
        highScores = new HighScores();
        screenWidth = Sys.getDeviceSettings().screenWidth;
        screenHeight= Sys.getDeviceSettings().screenHeight;
        center = Sys.getDeviceSettings().screenWidth / 2;
    }
    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new SnakeIQView(), new SnakeIQDelegate() ];
    }

}
