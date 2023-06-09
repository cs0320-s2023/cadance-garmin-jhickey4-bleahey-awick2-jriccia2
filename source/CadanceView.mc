import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Sensor;
import Toybox.Math;

// This is the main view of the application. It is responsible for
// displaying the current cadence, heart rate, and recommended energy
// level.
class CadanceView extends WatchUi.View {
  hidden var dataDelegate = new CadanceDataDelegate();

  hidden var energyLabel;
  hidden var cadenceLabel;
  hidden var heartRateLabel;
  hidden var energyText;
  hidden var cadenceText;
  hidden var heartRateText;
  hidden var energyFormat;

  function initialize() {
    View.initialize();
  }

  // Loads the resources when the application is laid out. Can not be
  // called in the constructor because the resources are not available
  // at that time.
  function onLayout(dc as Dc) as Void {
    setLayout(Rez.Layouts.MainLayout(dc));

    energyLabel = View.findDrawableById("Energy");
    heartRateLabel = View.findDrawableById("heartRate");
    cadenceLabel = View.findDrawableById("cadence");

    energyText = WatchUi.loadResource(Rez.Strings.EnergyText);
    cadenceText = WatchUi.loadResource(Rez.Strings.CadenceText);
    heartRateText = WatchUi.loadResource(Rez.Strings.HeartRateText);
    energyFormat = WatchUi.loadResource(Rez.Strings.EnergyFormat);

    Sensor.setEnabledSensors([Sensor.SENSOR_HEARTRATE]);
    Sensor.enableSensorEvents(method(:onSensor));
  }

  // Called when this View is brought to the foreground. Restore
  // the state of this View and prepare it to be shown. This includes
  // loading resources into memory.
  function onShow() as Void {}

  // Called when a sensor event occurs, such as a heart rate reading.
  // We use this to indicate when the view should be updated.
  function onSensor(sensorInfo as Sensor.Info) as Void {
    dataDelegate.updateFields(sensorInfo);

    if (dataDelegate.getHeartRate != 0 || dataDelegate.getCadence != 0) {
      requestUpdate();
    }
  }

  // Update the view
  function onUpdate(dc as Dc) as Void {
    dc.clear();
    View.onUpdate(dc);

    var energyToDisplay = (
      Math.round(dataDelegate.getEnergy() * 100d) / 100d
    ).format(energyFormat);

    energyLabel.setText(energyText + energyToDisplay);
    cadenceLabel.setText(cadenceText + dataDelegate.getCadence());
    heartRateLabel.setText(heartRateText + dataDelegate.getHeartRate());
  }

  // Called when this View is removed from the screen. Save the
  // state of this View here. This includes freeing resources from
  // memory.
  function onHide() as Void {}
}
