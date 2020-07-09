using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Application as App;

class SnakeIQMenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :newGame) {
            getArenaView();
        
        } else if (item == :settings) {
            WatchUi.pushView(new Rez.Menus.SettingsMenu(), new SnakeIQSettingsDelegate(), WatchUi.SLIDE_UP);
        
        } else if (item == :highScores) {
            WatchUi.pushView(new HighScoreView(), new HighScoreDelegate(), WatchUi.SLIDE_UP);
        }
    }

}

class SnakeIQSettingsDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :darkMode) {
            getDarkModeMenu();
        } else if (item == :snakeColor) {
            getSnakeColorMenu();
        }
    }

}

function getDarkModeMenu() {
    var menu = new Ui.Menu();
    var darkMode = App.getApp().getProperty("darkMode");
    Sys.println(darkMode);
    menu.setTitle("DarkMode");
    if (!darkMode) {
        menu.addItem("Enable", :enable); 
    } else {
        menu.addItem("disable", :disable); 
    }

    Ui.pushView(
        menu,
        new DarkModeSettingsDelegate(),
        Ui.SLIDE_IMMEDIATE
    );
}

function getSnakeColorMenu() {
    var menu = new Ui.Menu();
    menu.setTitle("Snake Color");
    menu.addItem("Green", :green); 
    menu.addItem("Blue", :blue); 
    menu.addItem("Pink", :pink); 
    menu.addItem("Yellow", :yellow); 
    menu.addItem("Orange", :range); 
    menu.addItem("Gray", :gray); 
    menu.addItem("Black", :black); 
    menu.addItem("Red", :red); 


    Ui.pushView(
        menu,
        new SnakeColorSettingsDelegate(),
        Ui.SLIDE_IMMEDIATE
    );
}

class SnakeColorSettingsDelegate extends Ui.MenuInputDelegate {
    var colorIndex;
    function initialize() {
        MenuInputDelegate.initialize();
        var colorIndex = 0;
    }

    function onMenuItem(item) {
        if (item == :Green) {
            colorIndex = 0;
        } else if (item == :blue) {
            colorIndex = 1;
        } else if (item == :pink) {
            Sys.println("Here");
            colorIndex = 2;
        } else if (item == :yellow) {
            colorIndex = 3;
        } else if (item == :range) {
            colorIndex = 4;
        } else if (item == :gray) {
            colorIndex = 5;
        } else if (item == :black) {
            colorIndex = 6;
        } else if (item == :red) {
            colorIndex = 7;
        } 

        App.getApp().setProperty("snakeColor", colorIndex);
    }
}

class DarkModeSettingsDelegate extends Ui.MenuInputDelegate {
    
    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :disable) {
            App.getApp().setProperty("darkMode", false);
        
        } else if (item == :enable) {
            App.getApp().setProperty("darkMode", true);
        }
    }
}
