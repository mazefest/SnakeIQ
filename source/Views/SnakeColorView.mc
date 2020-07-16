using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Application as App;

class SnakeColorView extends ArenaView{
    var colorIndex;
    var colors;
    var count;
    var label;
    
    function initialize() {
        ArenaView.initialize();
        configArenaPerimeter();
        snake = new Snake(10, $.center + 25, 140);
        colorIndex = App.getApp().getProperty("snakeColor");
        count = -1;
        colors = [
            Gfx.COLOR_GREEN,
            Gfx.COLOR_BLUE,
            Gfx.COLOR_PINK,
            Gfx.COLOR_YELLOW,
            Gfx.COLOR_ORANGE,
            Gfx.COLOR_DK_GRAY,
            Gfx.COLOR_RED,
            Gfx.COLOR_BLACK
        ];
    }

    function onUpdate(dc) {
        clearScreenAndConfig(dc);
        drawSnake(dc);
        configLabel();
        drawText(dc);
    }

    function driver() {
        var nextCoordinate = snake.getNextPlot();
        snake.moveForward(nextCoordinate[x], nextCoordinate[y]);

        if (count == 10 || count == -1) {
            snake.setDirection(1);
            count = 0;
        }

        count += 1;
        Ui.requestUpdate();
    }
    function drawText(dc) {
        dc.setColor(foregroundColor, Gfx.COLOR_TRANSPARENT);
        var x = $.screenWidth / 2; 
        var y = $.screenHeight / 2; 
        dc.drawText(
            x,
            y,
            Gfx.FONT_MEDIUM,
            label,
            Gfx.TEXT_JUSTIFY_CENTER
        );
    }

    function configLabel() {
        if (colorIndex == 0) {
            label = "Green";
        } else if (colorIndex == 1) {
            label = "Blue";
        } else if (colorIndex == 2) {
            label = "Pink";
        } else if (colorIndex == 3) {
            label = "Yellow";
        } else if (colorIndex == 4) {
            label = "Orange";
        } else if (colorIndex == 5) {
            label = "Gray";
        } else if (colorIndex == 6) {
            label = "Red";
        } else if (colorIndex == 7) {
            label = "Black";
            
        }
    }

    function drawPerimeter() {
        return true;
    }

    function changeColor(val) {
        colorIndex = (colorIndex + val) % colors.size();
        if (colorIndex < 0) {
            colorIndex = colors.size() - 1;
        }
        snakeColor = colors[colorIndex];
    }

    function configDifficulty() {
		timer.start(method(:driver), 100, true); 
    }

    function configArenaPerimeter() {
        arena.northWall = 0;
        arena.westWall = 0;
        arena.eastWall = 600;
        arena.southWall = 600;
    }

    function setColor() {
        App.getApp().setProperty("snakeColor", colorIndex);
    }
}

class SnakecolorDelegate extends Ui.BehaviorDelegate {
    var view;
    
    function initialize(view) {
        BehaviorDelegate.initialize();
        self.view = view;
    }

    function onSelect() {
        view.setColor();
        Ui.popView(Ui.SLIDE_IMMEDIATE);
    }

    function onNextPage() {
        view.changeColor(1);
    }
    function onPreviousPage() {
        view.changeColor(-1);
    }

}

function getSnakeColorView() {
    var view = new SnakeColorView();
    var delegate = new SnakecolorDelegate(view);
    Ui.pushView(
        view,
        delegate,
        Ui.SLIDE_IMMEDIATE
    );
}