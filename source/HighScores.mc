using Toybox.Application as App;
using Toybox.System as Sys;

class HighScores {
    var local;
    var remote;
    function initialize() {
        local = new ScoreStorage();
        remote = new RemoteScoreStorage();
    }
}

class ScoreStorage {
    var one;
    var two;
    var three;
    var four;
    var five;
   
    function initialize() {
        configScores();
    } 

    function configScores() {
        one = App.getApp().getProperty("localHS1");
        two = App.getApp().getProperty("localHS2");
        three = App.getApp().getProperty("localHS3");
        four = App.getApp().getProperty("localHS4");
        five = App.getApp().getProperty("localHS5");
    }

    function setScores() {
        App.getApp().setProperty("localHS1", one);
        App.getApp().setProperty("localHS2", two);
        App.getApp().setProperty("localHS3", three);
        App.getApp().setProperty("localHS4", four);
        App.getApp().setProperty("localHS5", five);
    }

    function addScore(score) {
        var scores = [five, four, three, two, one];
        var insert = null;
        var temp = five;
        
        if (score > five) {
            for (var i = 0; i < scores.size(); i++) {
                if (score > scores[i]) {
                    insert = i;   
                }
            }

            if (insert != null) {
                for (var i = 0; i <= insert; i++) {
                    if (i == insert) {
                        scores[i] = score;
                    } else {
                        var a = scores[i + 1];
                        scores[i] = a;
                    }
                }

            }

            one = scores[4];
            two = scores[3];
            three = scores[2];
            four = scores[1];
            five = scores[0];
        }
        
        setScores();
    }
}

class RemoteScoreStorage extends ScoreStorage {

    function initialize() {
        ScoreStorage.initialize();
    }

}
