using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

class ArenaView extends Ui.View {
    var arena;
    
    function initialize() {
        View.initialize();
        arena = new Arena();
    }

    function onUpdate(dc) {
       	dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_WHITE);
        dc.clear();


        drawPerimeter(dc);
        drawFood(dc);
    }
    
    function drawPerimeter(dc) {
        dc.setPenWidth(5);
        dc.drawRectangle(
            (arena.screenWidth - arena.width) / 2,
            (arena.screenHeight - arena.height) / 2,
            arena.width,
            arena.height
        );
    }

    function drawFood(dc) {
        Ui.requestUpdate();
        Sys.println(arena.foodX + " " + arena.foodY);
        dc.drawPoint(arena.foodX, arena.foodY);
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



