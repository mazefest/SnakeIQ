using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;
using Toybox.System as Sys;

class HighScoreView extends Ui.View {
    var page;
    var easyScores;
    var mediumScores;
    var expertScores;
    var scores;
    var difficulty;
    function initialize() {
        View.initialize();
        page = 0;
        difficulty = ["Expert", "Medium", "Easy"];
        configScores();
    }

    function onUpdate(dc) {
        View.onUpdate(dc);
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);

        drawTitle(dc);
        drawDivider(dc);
        drawScores(dc);
    }

    function configScores() {
        easyScores = $.highScores.easy.getScores();
        mediumScores = $.highScores.medium.getScores();
        expertScores = $.highScores.local.getScores();
        scores = [expertScores, mediumScores, easyScores];
        Sys.println(scores);
    }

    function getTitle() {
        return difficulty[page] + " Scores";
    }

    function drawTitle(dc) {
        dc.drawText(
            dc.getWidth() / 2, 
            15,
            Gfx.FONT_SMALL,
            getTitle(),
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
        var pageScore = scores[page];
        dc.drawText(
            dc.getWidth() / 2, 
            20 + dc.getFontHeight(Gfx.FONT_SMALL),
            Gfx.FONT_SMALL,
            "1. " + pageScore[0] + "\n" +
            "2. " + pageScore[1] + "\n" +
            "3. " + pageScore[2] + "\n" +
            "4. " + pageScore[3] + "\n" +
            "5. " + pageScore[4] + "\n",
            Gfx.TEXT_JUSTIFY_CENTER
        );
    }

}

class HighScoreDelegate extends Ui.BehaviorDelegate {
    var view;
    function initialize(view) {
        self.view = view;
        BehaviorDelegate.initialize();
    }

    function onSelect() {
        return true;
    }

    function onNextPage() {
        view.page = (view.page + 1) % 3;
        Ui.requestUpdate();
    }

    function onPreviousPage() {
        var pageNumber = view.page;
        if ((pageNumber - 1) < 0) {
            view.page = 2;
        } else {
            view.page -= 1;
        }

        Ui.requestUpdate();
    }

}