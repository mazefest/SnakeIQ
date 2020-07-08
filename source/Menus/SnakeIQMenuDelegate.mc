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
