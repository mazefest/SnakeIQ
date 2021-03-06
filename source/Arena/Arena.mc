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
    var x;
    var y;
    
    function initialize() {
        configArenaDimensions();
        configFoodCoordinates();
        configPerimeterStartingPoint();
        configWallValues();
    }

    function configArenaDimensions() {
       screenWidth = Sys.getDeviceSettings().screenWidth; 
       screenHeight = Sys.getDeviceSettings().screenHeight; 
       var sWSquared = Math.pow(screenWidth, 2) / 2;
       var sHSquared = Math.pow(screenHeight, 2) / 2;
       width = Math.sqrt(sWSquared).toNumber();
       height = Math.sqrt(sHSquared).toNumber();
       width -= width % 5;
       height -= height % 5;
    }

    function configPerimeterStartingPoint() {
        x = ((screenWidth - width) / 2);
        y = ((screenHeight - height) / 2);
        x -= x % 5;
        y -= y % 5;
    }

    function configFoodCoordinates() {
        var penWidth = 5;
        var randX = (Math.rand() % ((width - penWidth * 2) / 5)) * 5;
        var randY = (Math.rand() % ((height - penWidth * 2) / 5)) * 5;
        foodX = (randX) + ((screenWidth - width) / 2) + penWidth;
        foodY = (randY) + ((screenHeight - height) / 2) + penWidth;
        foodX -= foodX % 5;
        foodY -= foodY % 5;
    }

    function configWallValues() {
        northWall = y; 
        westWall = x;
        southWall = (northWall + height);
        eastWall = westWall+ width;
    }

}