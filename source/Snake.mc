using Toybox.System as Sys;

enum {
    North,
    East,
    South,
    West
}

enum {
    x,
    y
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
        direction = South;
        xCoordinates = [];
        yCoordinates = [];
        size = 4;
        configInitialXYCoordinates();
    }

    function getDirection() {
        return direction;
    }

    function setDirection(dir) {
        if (direction == 0 && dir == -1) {
            direction = South;
        } else {
            direction += dir % 4;
        }
    }

    function getDirectionCoordinate() {
        if (direction == North) {
            return [0, -5];
        } else if (direction == East) {
            return [5, 0];
        } else if (direction == South) {
            return [0, 5];
        } else if (direction == West) {
            return [-5, 0];
        } else {
            return [0, 0];
        }
    }

    function configInitialXYCoordinates() {
        for (var i = 0; i < size; i ++) {
            xCoordinates.add(120);
            yCoordinates.add((120 / 2) - ((i + 1) * 5)) ;
        }
    }

    function driver() {
        var nextCoordinate = getDirectionCoordinate();
        Sys.println("xCoordinates >> " + xCoordinates);
        Sys.println("yCoordinates >> " + yCoordinates);
        Sys.println(nextCoordinate);
        var nextXCoordinate = xCoordinates[xCoordinates.size() -1] + nextCoordinate[x];
        var nextYCoordinate = yCoordinates[yCoordinates.size() -1] + nextCoordinate[y];
        
        xCoordinates.remove(xCoordinates[0]);
        yCoordinates.remove(yCoordinates[0]);

        xCoordinates.add(nextXCoordinate);
        yCoordinates.add(nextYCoordinate);
    }

}