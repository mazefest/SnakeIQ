using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

class ArenaView extends Ui.View {
    var arena;
    var snake; 
    var timer;

    function initialize() {
        View.initialize();
        arena = new Arena();
        snake = new Snake();
        timer = new Timer.Timer();
		timer.start(method(:driver), 400, true); 
    }

    function onUpdate(dc) {
        clearScreenAndConfig(dc);
        drawPerimeter(dc);
        drawScore(dc);
        drawFood(dc);
        drawSnake(dc);
        drawGameOver(dc);
        Ui.requestUpdate();
    }

    function driver() {
        foodCheck();
        
        snake.arenaCollisionCheck(
            arena.northWall,
            arena.eastWall,
            arena.southWall,
            arena.westWall
        );
        
        snake.driver();
    }

    function clearScreenAndConfig(dc) {
       	dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_WHITE);
        dc.clear();
        dc.setPenWidth(5);

    } 

    function drawPerimeter(dc) {
        dc.drawRectangle(
            (arena.screenWidth - arena.width) / 2,
            (arena.screenHeight - arena.height) / 2,
            arena.width,
            arena.height
        );
    }
    
    function drawSnake(dc) {
        for (var i = 0; i < snake.size; i++) {
            dc.drawPoint(
                snake.xCoordinates[i],
                snake.yCoordinates[i]
            );
        }
    }

    function drawFood(dc) {
        dc.drawPoint(arena.foodX, arena.foodY);
    }

    function drawScore(dc) {
        var screenWidth = Sys.getDeviceSettings().screenWidth; 
        dc.drawText(
            screenWidth / 2,
            3,
            Gfx.FONT_SMALL,
            "Score:" + (snake.size - 4),
            Gfx.TEXT_JUSTIFY_CENTER
        );
    }

    function drawGameOver(dc) {
        if (!snake.isAlive) {
            var screenWidth = Sys.getDeviceSettings().screenWidth; 
            var screenHeight = Sys.getDeviceSettings().screenHeight; 
            dc.drawText(
                screenWidth / 2,
                screenHeight / 2 - (dc.getFontHeight(Gfx.FONT_MEDIUM) / 2), 
                Gfx.FONT_MEDIUM,
                "GAME OVER",
                Gfx.TEXT_JUSTIFY_CENTER
            );
        }
    }

    function foodCheck() {
        var nextCoordinate = snake.getSnakeHead();
        if (nextCoordinate[x] == arena.foodX && nextCoordinate[y] == arena.foodY) {
            arena.configFoodCoordinates();
            snake.hasEaten = true;
        }
    }
}


function getArenaView() {
    var view = new ArenaView();
    var delegate = new ArenaDelegate(view);
    Ui.pushView(
        view,
        delegate,
        Ui.SLIDE_IMMEDIATE
    );
}



