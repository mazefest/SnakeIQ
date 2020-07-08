using Toybox.WatchUi;

class SnakeIQDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onSelect() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new SnakeIQMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}