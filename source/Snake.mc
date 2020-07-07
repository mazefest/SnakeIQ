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
    var hasEaten;
    var direction;
    var inventory;
    var size;
    var xCoordinates;
    var yCoordinates;

    function initialize() {
        isAlive = true;
        hasEaten = false;
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
            direction = West;
        } else {
            direction = (direction + dir) % 4;
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
        for (var i = size; i > 0; i--) {
            var x = 120;
            var y = (120 / 2) - (i * 5);
            y -= y % 5;
            xCoordinates.add(x);
            yCoordinates.add(y);
        }
    }

    function eatAndGrow(x, y) {
        size += 1;
        xCoordinates.add(x);
        yCoordinates.add(y);
        hasEaten = false;
    }

    function moveForward(x, y) {
        if (isAlive) {
            xCoordinates.remove(xCoordinates[0]);
            yCoordinates.remove(yCoordinates[0]);
            xCoordinates.add(x);
            yCoordinates.add(y);
        }
    }
    
    function getSnakeHead() {
        var x = xCoordinates[xCoordinates.size() - 1];
        var y = yCoordinates[yCoordinates.size() - 1];
        return [x, y];
    }

    function selfCollisionCheck(x, y) {
        for (var i = 0; i < size -1; i ++) {
            if (x == xCoordinates[i] && y == yCoordinates[i]) {
                isAlive = false;
            }
        }
    }

    function arenaCollisionCheck(northWall, eastWall, southWall, westWall) {
        var head = getNextPlot(); 
        if (head[x] >= eastWall || 
            head[x] <= westWall ||
            head[y] <= northWall || 
            head[y] >= southWall) {
            isAlive = false;
        }
    }

    function getNextPlot() {
        var nextCoordinate = getDirectionCoordinate();
        var nextXCoordinate = xCoordinates[xCoordinates.size() -1] + nextCoordinate[x];
        var nextYCoordinate = yCoordinates[yCoordinates.size() -1] + nextCoordinate[y];
        return [nextXCoordinate, nextYCoordinate];
    }

}