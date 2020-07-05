using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class ArenaDelegate extends Ui.BehaviorDelegate {
    var view;
    function initialize(view) {
        BehaviorDelegate.initialize();
        self.view = view;
    }

    function onSelect() {
        if (!view.snake.isAlive) {
            //go home
        } else {
            // pause
        }    
        return true;
    }

    function onNextPage() {
        view.snake.setDirection(1);
    }
    function onPreviousPage() {
        view.snake.setDirection(-1);
    }

}