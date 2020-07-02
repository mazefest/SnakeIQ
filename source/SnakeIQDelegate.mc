using Toybox.WatchUi;

class SnakeIQDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new SnakeIQMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}