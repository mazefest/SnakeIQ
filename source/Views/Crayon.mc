using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Application as App;

class Crayon {
    var colors;
    var darkMode;
    var foregroundColor;
    var backgroundColor;
    var rainbowIndex;
    var colorIndex;
    var rainbowMode;
    var systemColor;

    function initialize() {
        rainbowIndex = 0;
        colorIndex = 0;
        rainbowMode = false;
        configDarkMode();
        configColors();
    }

    function configColors() {
        colors = [
            Gfx.COLOR_GREEN,
            Gfx.COLOR_BLUE,
            Gfx.COLOR_PINK,
            Gfx.COLOR_YELLOW,
            Gfx.COLOR_ORANGE,
            Gfx.COLOR_DK_GRAY,
            Gfx.COLOR_RED,
            getSystemColor(),
            getRainbowColor()
        ];
    }

    function getSystemColor() {
        if (darkMode) {
            return Gfx.COLOR_WHITE;
        } else {
            return Gfx.COLOR_BLACK;
        }
    }

    function configDarkMode() {
        darkMode = App.getApp().getProperty("darkMode");
        if (darkMode) {
            foregroundColor = Gfx.COLOR_WHITE;
            backgroundColor = Gfx.COLOR_BLACK;
        } else {
            foregroundColor = Gfx.COLOR_BLACK;
            backgroundColor = Gfx.COLOR_WHITE;
        }
    }

    function getRainbowColor() {
        if (colors == null) {
            return Gfx.COLOR_GREEN;
        }
        if (rainbowIndex > 3) {
            rainbowIndex = 0;
            colorIndex = (colorIndex + 1) % (colors.size() - 1);
        } else {
            rainbowIndex += 1;
        }

        return colors[colorIndex];
    }
}