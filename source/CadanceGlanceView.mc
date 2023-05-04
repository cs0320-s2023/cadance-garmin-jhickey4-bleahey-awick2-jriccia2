import Toybox.Graphics;
import Toybox.WatchUi;

(:glance)
class CadanceGlanceView extends WatchUi.GlanceView {
  hidden var glanceLayout;

  function initialize() {
    GlanceView.initialize();
  }

  // Load your resources here
  function onLayout(dc as Dc) as Void {
    View.onLayout(dc);
    dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
  }

  // Called whenever the glance view updates. This draws the CaDance logo.
  function onUpdate(dc as Dc) as Void {
    View.onUpdate(dc);

    // Clears the screen
    dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
    dc.clear();

    // Draws the CaDance logo manually, as resources are not supported in
    // glance views.
    dc.setColor(Graphics.COLOR_ORANGE, Graphics.COLOR_BLACK);
    dc.drawText(
      dc.getWidth() / 2,
      dc.getHeight() / 2,
      Graphics.FONT_LARGE,
      "CaDance",
      Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
    );
  }
}
