
enum {
    North,
    East,
    South,
    west
}

class SnakeInvenotry() {
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

    function initialize() {
        isAlive = true;
        direction = North;
        inventory = new SnakeInvenotry();
    }

    function isAlive() {
        return isAlive;
    }

    function getDirection() {
        return direction;
    }

    function setDirection(dir) {
        direction = dir;
    }

}