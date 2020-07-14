using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Application as App;
enum {expert, medium, easy}
class ArenaView extends Ui.View {
    var arena;
    var snake; 
    var timer;
    var paused;
    var scoreSent;
    var darkMode;
    var backgroundColor;
    var forgroundColor;
    var snakeColor;

    function initialize() {
        View.initialize();
        paused = false;
        scoreSent = false;
        arena = new Arena();
        snake = new Snake();
        timer = new Timer.Timer();
        configDifficulty();
        configColor();
        configSnakeColor();
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

        } else if (!snake.isAlive && !scoreSent) {
            var difficulty = App.getApp().getProperty("difficulty");
            var score = snake.size - 4;
            $.highScores.addScore(score, difficulty);
            scoreSent = true;
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
       	dc.setColor(snakeColor, Gfx.COLOR_TRANSPARENT);
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
            var text = "GAME OVER";
            if (snake.size - 4 > highScores.local.one) {
                text = "NEW HIGH SCORE!!!";
            }
            dc.drawText(
                screenWidth / 2,
                screenHeight / 2 - (dc.getFontHeight(Gfx.FONT_MEDIUM) / 2), 
                Gfx.FONT_MEDIUM,
                text,
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

    function configDifficulty() {
        var difficulty = App.getApp().getProperty("difficulty");
        var diffTimer = 0;
        
        if (difficulty == 0) {
            diffTimer = 100;
        } else if (difficulty == 1) {
            diffTimer = 300;
        } else {
            diffTimer = 500;
        }

		timer.start(method(:driver), diffTimer, true); 

    }

    function configColor() {
        darkMode = App.getApp().getProperty("darkMode");
        if (darkMode) {
            forgroundColor = Gfx.COLOR_WHITE;
            backgroundColor = Gfx.COLOR_BLACK;
        } else {
            forgroundColor = Gfx.COLOR_BLACK;
            backgroundColor = Gfx.COLOR_WHITE;
        }
    }

    function configSnakeColor() {
        var colorIndex = App.getApp().getProperty("snakeColor");
        var colors = [
            Gfx.COLOR_GREEN,
            Gfx.COLOR_BLUE,
            Gfx.COLOR_PINK,
            Gfx.COLOR_YELLOW,
            Gfx.COLOR_ORANGE,
            Gfx.COLOR_DK_GRAY,
            Gfx.COLOR_RED,
            Gfx.COLOR_BLACK
        ];
        snakeColor = colors[colorIndex];
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



