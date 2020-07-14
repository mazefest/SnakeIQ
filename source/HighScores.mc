using Toybox.Application as App;
using Toybox.System as Sys;

class HighScores {
    var easy;
    var medium;
    var local;
    var remote;
    function initialize() {
        easy = new ScoreStorage("elocalHS1", "elocalHS2", "elocalHS3", "elocalHS4", "elocalHS5");   
        medium = new ScoreStorage("mlocalHS1", "mlocalHS2", "mlocalHS3", "mlocalHS4", "mlocalHS5");   
        local = new ScoreStorage("localHS1", "localHS2", "localHS3", "localHS4", "localHS5");   
    }

    function addScore(score, difficulty) {
        if (difficulty == 2) {
            easy.addScore(score);
        
        } else if (difficulty == 1) {
            medium.addScore(score);
        
        } else if (difficulty == 0) {
            local.addScore(score);
        }
    }
}

class ScoreStorage {
    var one;
    var two;
    var three;
    var four;
    var five;

    var keyOne;
    var keyTwo;
    var keyThree;
    var keyFour; 
    var keyFive;

    function initialize(keyOne, keyTwo, keyThree, keyFour, keyFive) {
        self.keyOne = keyOne;
        self.keyTwo = keyTwo;
        self.keyThree = keyThree;
        self.keyFour = keyFour;
        self.keyFive = keyFive;
        configScores();
    } 

    function configScores() {
        one = App.getApp().getProperty(keyOne);
        two = App.getApp().getProperty(keyTwo);
        three = App.getApp().getProperty(keyThree);
        four = App.getApp().getProperty(keyFour);
        five = App.getApp().getProperty(keyFive);
    }

    function setScores() {
        App.getApp().setProperty(keyOne, one);
        App.getApp().setProperty(keyTwo, two);
        App.getApp().setProperty(keyThree, three);
        App.getApp().setProperty(keyFour, four);
        App.getApp().setProperty(keyFive, five);
    }

    function getScores() {
        return [one, two, three, four, five];
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
