using Toybox.Application;
using Toybox.WatchUi;

var highScores;

class SnakeIQApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
        highScores = new HighScores();
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
