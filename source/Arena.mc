using Toybox.System as Sys;

class Arena {
    var width;
    var height;
    var food;

    function initialize() {
        configWidth();
        configHeight();
        configFoodCoordinates();
    }

    function configWidth() {
       width = Sys.getDeviceSettings().screenWidth; 
    }

    function configHeight() {
       height = Sys.getDeviceSettings().screenHeight; 

    }

    function configFoodX() {

    }

    function configFoodY() {

    }

}