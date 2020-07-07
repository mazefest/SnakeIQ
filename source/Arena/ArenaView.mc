using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Application as App;

class ArenaView extends Ui.View {
    var arena;
    var snake; 
    var timer;
    var paused;
    var backgroundColor;
    var forgroundColor;

    function initialize() {
        View.initialize();
        paused = false;
        arena = new Arena();
        snake = new Snake();
        timer = new Timer.Timer();
		timer.start(method(:driver), 100, true); 
        configColor();
    }

    function onUpdate(dc) {
        clearScreenAndConfig(dc);
        drawPerimeter(dc);
        drawScore(dc);
        drawFood(dc);
        drawSnake(dc);
        drawGameOver(dc);
        drawPause(dc);
    }

    function start() {
        paused = false;
    }

    function pause() {
        paused = true;
    }

    function onHide() {
        timer.stop();
    }

    function driver() {
        var nextCoordinate = snake.getNextPlot();
        
        foodCheck();

        if (snake.hasEaten) {
            snake.eatAndGrow(nextCoordinate[x], nextCoordinate[y]);
        
        } else if (snake.isAlive && !paused) {
            snake.selfCollisionCheck(nextCoordinate[x], nextCoordinate[y]);
            snake.arenaCollisionCheck(arena.northWall, arena.eastWall, arena.southWall, arena.westWall);
            snake.moveForward(nextCoordinate[x], nextCoordinate[y]);
        } 

        Ui.requestUpdate();
    }

    function clearScreenAndConfig(dc) {
       	dc.setColor(forgroundColor, backgroundColor);
        dc.clear();
        dc.setPenWidth(5);
    } 

    function drawPerimeter(dc) {
        dc.drawRectangle(
            arena.x,
            arena.y,
            arena.width + (1),
            arena.height + (1)
        );
    }

    function drawSnake(dc) {
       	dc.setColor(Gfx.COLOR_GREEN, Gfx.COLOR_TRANSPARENT);
        for (var i = 0; i < snake.size; i++) {
            dc.drawPoint(
                snake.xCoordinates[i],
                snake.yCoordinates[i]
            );
        }
       	dc.setColor(forgroundColor, backgroundColor);
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

    
    function drawPause(dc) {
        if (paused) {
            var screenWidth = Sys.getDeviceSettings().screenWidth; 
            var screenHeight = Sys.getDeviceSettings().screenHeight; 
            dc.drawText(
                screenWidth / 2,
                screenHeight / 2 - (dc.getFontHeight(Gfx.FONT_MEDIUM) / 2), 
                Gfx.FONT_MEDIUM,
                "PAUSED",
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

    function configColor() {
        darkMode = app.getApp().getProperty("darkMode");
        if (darkMode) {
            forgroundColor = COLOR_WHITE;
            backgroundColor = COLOR_BLACK;
        } else {
            forgroundColor = COLOR_BLACK;
            backgroundColor = COLOR_WHITE;
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


