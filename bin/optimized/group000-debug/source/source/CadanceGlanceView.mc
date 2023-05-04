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
    dc.setColor(
      0 as Toybox.Graphics.ColorValue,
      0 as Toybox.Graphics.ColorValue
    );
  }

  function onUpdate(dc as Dc) as Void {
    var pre_0;
    pre_0 = 0;
    View.onUpdate(dc);
    dc.setColor(
      pre_0 as Toybox.Graphics.ColorValue,
      pre_0 as Toybox.Graphics.ColorValue
    );
    dc.clear();
    dc.setColor(
      16733440 as Toybox.Graphics.ColorValue,
      pre_0 as Toybox.Graphics.ColorValue
    );
    dc.drawText(
      dc.getWidth() / 2,
      dc.getHeight() / 2,
      4 as Toybox.Graphics.FontDefinition,
      "CaDance",
      5
    );
  }
}
