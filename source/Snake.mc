
enum {
    North,
    East,
    South,
    west
}

class SnakeInvenotry {
}

class Snake {
    var isAlive;
    var direction;
    var inventory;
    var size;
    var xCoordinates;
    var yCoordinates;

    function initialize() {
        isAlive = true;
        direction = North;
        xCoordinates = [];
        yCoordinates = [];
        size = 4;
        configInitialXYCoordinates();
    }

    function getDirection() {
        return direction;
    }

    function setDirection(dir) {
        direction = dir;
    }

    function configInitialXYCoordinates() {
        for (var i = 0; i < size; i ++) {
            xCoordinates.add(120);
            yCoordinates.add((120 / 2) - ((i + 1)*5)) ;
        }
    }

    function coordinateDriver() {

    }

}