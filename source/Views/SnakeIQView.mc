using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;

class SnakeIQView extends Ui.View {

    function initialize() {
        View.initialize();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        View.onUpdate(dc);

        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);

        drawTitle(dc);
    }

    function drawTitle(dc) {
        dc.drawText(
            dc.getWidth() / 2, 
            dc.getWidth() / 2 - (dc.getFontHeight(Gfx.FONT_LARGE) / 2),
            Gfx.FONT_LARGE,
            "SNAKEIQ",
            Gfx.TEXT_JUSTIFY_CENTER
            );
    }

}
