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
       width -= width % 5;
       height = Math.sqrt(sHSquared).toNumber();
    }

    function configFoodCoordinates() {
        var randX = (Math.rand() % ((width - 10) / 5)) * 5;
        var randY = (Math.rand() % ((height - 10) / 5)) * 5;
        foodX = (randX) + ((screenWidth - width) / 2) + 5;
        foodY = (randY) + ((screenHeight - height) / 2) + 5;
    }

    function configWallValues() {
        northWall = (((screenHeight - height) / 2) + 5).toNumber(); 
        westWall = (((screenHeight - height) / 2) + 5).toNumber();
        southWall = (northWall + width) - 10;
        eastWall = (westWall + height) - 10; 
    }

}