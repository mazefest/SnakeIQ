using Toybox.System as Sys;
using Toybox.Math as Math;

class Arena {
    var width;
    var height;
    var foodX;
    var foodY;

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

    function configFoodCoordinates() {
        configFoodX();
        configFoodY();
    }

    function configFoodX() {
        foodX = Math.rand % width;
    }

    function configFoodY() {
        foodX = Math.rand % height;
    }

}