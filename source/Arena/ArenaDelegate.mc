using Toybox.WatchUi as Ui;
using Toybox.System as Sys;


class ArenaDelegateTactile extends Ui.BehaviorDelegate {
    var view;
    
    function initialize(view) {
        UpDownWrapper.initialize();
        self.view = view;
    }

    function onSelect() {
        if (!view.snake.isAlive) {
            Ui.popView(Ui.SLIDE_IMMEDIATE);
        } else if (view.paused) {
            view.start();
        } else {
            view.pause();
        }    
        
        return true;
    }

    function onNextPage() {
        view.snake.setDirection(1);
        return true;
    }

    function onPreviousPage() {
        view.snake.setDirection(-1);
        return true;
    }
    
}

class ArenaDelegateTouch extends UpDownWrapper {
    var view;
    
    function initialize(view) {
        UpDownWrapper.initialize();
        self.view = view;
    }

    function onSelect() {
        if (!view.snake.isAlive) {
            Ui.popView(Ui.SLIDE_IMMEDIATE);
        } else if (view.paused) {
            view.start();
        } else {
            view.pause();
        }    
        
        return true;
    }

    //function onNextPage() {
        //Sys.println("onNextPage()");
        //view.snake.setDirection(1);
        //return true;
    //}

    //function onPreviousPage() {
        //Sys.println("onPreviousPage()");
        //view.snake.setDirection(-1);
        //return true;
    //}
    
    /*function onBack() {
        onPreviousPage();
        return true;
    }*/

}

class UpDownWrapper extends Ui.BehaviorDelegate {
	
    function initialize() {
		BehaviorDelegate.initialize();
    }

    /*function onNextPage() {
        Sys.println("onNextPage()");
        //view.snake.setDirection(1);
        //return true;
    }

    function onPreviousPage() {
        Sys.println("onPreviousPage()");
        //view.snake.setDirection(-1);
        //return true;
    }*/

    function onSwipe(evt) {
        Sys.println("SWIPE");
        var event = evt.getDirection();
        var direction = view.snake.getDirection();

        if (direction == North) {
            onNorthSwipe(event);
        } else if (direction == South) {
            onSouthSwipe(event);
        } else if (direction == East) {
            onEastSwipe(event);
        } else if (direction == West) {
            onWestSwipe(event);
        }
        
        return true;
    }

    function onSouthSwipe(event) {
        if (event == Ui.SWIPE_LEFT) {
            view.snake.setDirection(1);
        } else if (event == Ui.SWIPE_RIGHT) {
            view.snake.setDirection(-1);
        }
    }

    function onNorthSwipe(event) {
        if (event == Ui.SWIPE_LEFT) {
            view.snake.setDirection(-1);
        } else if (event == Ui.SWIPE_RIGHT) {
            view.snake.setDirection(1);
        }
    }

    function onEastSwipe(event) {
        if (event == Ui.SWIPE_UP) {
            view.snake.setDirection(-1);
        } else if (event == Ui.SWIPE_DOWN) {
            view.snake.setDirection(1);
        }
    }

    function onWestSwipe(event) {
        if (event == Ui.SWIPE_UP) {
            view.snake.setDirection(1);
        } else if (event == Ui.SWIPE_DOWN) {
            view.snake.setDirection(-1);
        }
    }



	/*function onSwipe(evt) {
        var event = evt.getDirection();
        if (event == Ui.SWIPE_LEFT) {
            
            if (view.snake.getDirection() == North) {
                return onPreviousPage();
            } else {
                return onNextPage();
            }
		
        } else if (event == Ui.SWIPE_RIGHT) {
			return onNextPage();
		
        } else if (event == Ui.SWIPE_UP) {
            Sys.println("UP");
            if (view.snake.getDirection() == East) {
                return onNextPage();
            } else {
                return onPreviousPage();
            }
		} else if (event == Ui.SWIPE_DOWN) {
            if (view.snake.getDirection() == East) {
                return onPreviousPage();
            } else {
                return onNextPage();
            }
		} else {
			return true;
		}
        
	}*/

}