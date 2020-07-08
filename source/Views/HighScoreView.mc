using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;

class HighScoreView extends Ui.View {

    function initialize() {
        View.initialize();
    }

    function onUpdate(dc) {
        View.onUpdate(dc);
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);

        drawTitle(dc);
        drawDivider(dc);
        drawScores(dc);
    }

    function drawTitle(dc) {
        dc.drawText(
            dc.getWidth() / 2, 
            15,
            Gfx.FONT_SMALL,
            "HIGH SCORES",
            Gfx.TEXT_JUSTIFY_CENTER
        );
    }

    function drawDivider(dc) {
        dc.drawLine(
            0, 
            18 + dc.getFontHeight(Gfx.FONT_SMALL),
            400, 
            18 + dc.getFontHeight(Gfx.FONT_SMALL)
            );
    }

    function drawScores(dc) {
        dc.drawText(
            dc.getWidth() / 2, 
            20 + dc.getFontHeight(Gfx.FONT_SMALL),
            Gfx.FONT_SMALL,
            "1. " + $.highScores.local.one + "\n" +
            "2. " + $.highScores.local.two + "\n" +
            "3. " + $.highScores.local.three + "\n" +
            "4. " + $.highScores.local.four + "\n" +
            "5. " + $.highScores.local.five + "\n",
            Gfx.TEXT_JUSTIFY_CENTER
        );
    }

}

class HighScoreDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onSelect() {
        return true;
    }

}