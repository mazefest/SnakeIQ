using Toybox.System as Sys;
using Toybox.Math as Math;

class Arena {
    var width;
    var height;
    var screenHeight;
    var screenWidth;
    var foodX;
    var foodY;
    var northWall;
    var eastWall;
    var southWall;
    var westWall;
    
    function initialize() {
        configArenaDimensions();
        configFoodCoordinates();
        configWallValues();
    }

    function configArenaDimensions() {
       screenWidth = Sys.getDeviceSettings().screenWidth; 
       screenHeight = Sys.getDeviceSettings().screenHeight; 
       var sWSquared = Math.pow(screenWidth, 2) / 2;
       var sHSquared = Math.pow(screenHeight, 2) / 2;
       width = Math.sqrt(sWSquared).toNumber();
       height = Math.sqrt(sHSquared).toNumber();

        Sys.println("screen width: " + screenWidth);
        Sys.println("screen height: " + screenHeight);
        Sys.println("arena width: " + width);
        Sys.println("arena height: " + height);

    }

    function configFoodCoordinates() {
        foodX = (Math.rand() % (width - 10).toNumber()) + ((screenWidth - width) / 2) + 5;
        foodY = (Math.rand() % (height - 10).toNumber()) + ((screenHeight - height) / 2) + 5;
    }

    function configWallValues() {
        northWall = (((screenHeight - height) / 2) + 5).toNumber(); 
        westWall = (((screenHeight - height) / 2) + 5).toNumber();
        southWall = (northWall + width) - 10;
        eastWall = (westWall + height) - 10; 
    }



}