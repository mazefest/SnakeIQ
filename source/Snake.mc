
enum {
    North,
    East,
    South,
    west
}

class SnakeInvenotry {
    var size;
    
    function initialize() {
       size = 4; 
    }
    
    function addToLength() {
        size += 1;
    }

    function getSize() {
        return size;
    }
    
}

class Snake {
    var isAlive;
    var direction;
    var inventory;
    var snakeXCoordinates;
    var snakeYCoordinates;

    function initialize() {
        isAlive = true;
        direction = North;
        inventory = new SnakeInvenotry();
        snakeXCoordinates = [];
        snakeYCoordinates = [];
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
            //snakeXCoordinates.add($.arena.width / 2);
            //snakeYCoordinates.add(($.arena.height / 2) - (i + 1));
        }
    }

    function coordinateDriver() {

    }

}