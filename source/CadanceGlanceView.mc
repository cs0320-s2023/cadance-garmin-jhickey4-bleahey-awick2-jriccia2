import Toybox.Graphics;
import Toybox.WatchUi;

(:glance) class CadanceGlanceView extends WatchUi.GlanceView {
    hidden var glanceLayout;

    function initialize() {
        GlanceView.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        View.onLayout(dc);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
    }

    function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear(); 
        dc.setColor(Graphics.COLOR_ORANGE, Graphics.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, dc.getHeight()/2, Graphics.FONT_LARGE, 
        "CaDance", Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

}
