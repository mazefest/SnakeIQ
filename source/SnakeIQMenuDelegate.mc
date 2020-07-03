using Toybox.WatchUi;
using Toybox.System;

class SnakeIQMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :item_1) {
            getArenaView();
        }
    }

}