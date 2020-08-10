using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class ArenaDelegate extends UpDownWrapper {
    var view;
    
    function initialize(view) {
        BehaviorDelegate.initialize();
        self.view = view;
    }

    function onSelect() {
        if (!view.snake.isAlive) {
        
        } else if (view.paused) {
            view.start();
        
        } else {
            view.pause();
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

class UpDownWrapper extends Ui.BehaviorDelegate {
	function initialize() {
		BehaviorDelegate.initialize();
	}
	function onSwipe(evt) {
		if (evt.getDirection() == Ui.SWIPE_LEFT) {
			return onNextPage();
		} else if (evt.getDirection() == Ui.SWIPE_RIGHT) {
			return onPreviousPage();
		} else if (evt.getDirection() == Ui.SWIPE_UP) {
			return onNextPage();
		} else if (evt.getDirection() == Ui.SWIPE_DOWN) {
			return onPreviousPage();
		} else {
			return true;
		}
	}
}