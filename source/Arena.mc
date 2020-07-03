using Toybox.System as Sys;
using Toybox.Math as Math;

class Arena {
    var width;
    var height;
    var screenHeight;
    var screenWidth;
    var foodX;
    var foodY;
    
    function initialize() {
        configArenaDimensions();
        configFoodCoordinates();
    }

    function configArenaDimensions() {
       screenWidth = Sys.getDeviceSettings().screenWidth; 
       screenHeight = Sys.getDeviceSettings().screenHeight; 
       var sWSquared = Math.pow(screenWidth, 2) / 2;
       var sHSquared = Math.pow(screenHeight, 2) / 2;
       width = Math.sqrt(sWSquared).toNumber();
       height = Math.sqrt(sHSquared).toNumber();
    }

    function configFoodCoordinates() {
        foodX = (Math.rand() % width.toNumber()) + ((screenWidth - width) / 2);
        foodY = (Math.rand() % height.toNumber()) + ((screenHeight - height) / 2);
    }


}