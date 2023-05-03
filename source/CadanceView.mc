import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Sensor;

class CadanceView extends WatchUi.View {
    //make liberal use of hiddenvar to store things like 
    //song bpm, song length, etc.

    var bpmText = "Reccommended BPM: ";
    var cadenceText = "Cadence: ";
    var heartRateText = "Heart Rate: ";

    var dataDelegate = new CadanceDataDelegate(self);

    var bpmLabel;
    var cadenceLabel;
    var heartRateLabel;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
        //TODO: add these labels into the layout
        cadenceLabel = View.findDrawableById("cadence");
        bpmLabel = View.findDrawableById("Recommendation");
        heartRateLabel = View.findDrawableById("heartRate");

        Sensor.setEnabledSensors([Sensor.SENSOR_HEARTRATE]);
        Sensor.enableSensorEvents(method(:onSensor));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Called when a sensor event occurs, such as a heart rate reading.
    // We use this to indicate when the view should be updated.
    function onSensor(sensorInfo as Sensor.Info) as Void {
        dataDelegate.updateFields(sensorInfo);

        if(dataDelegate.getHeartRate != 0 ||
            dataDelegate.getCadence != 0 ||
            dataDelegate.getBPM != 0){
            requestUpdate();
        }
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        dc.clear();
        View.onUpdate(dc);

        bpmLabel.setText(bpmText + dataDelegate.getBPM());
        cadenceLabel.setText(cadenceText + dataDelegate.getCadence());
        heartRateLabel.setText(heartRateText + dataDelegate.getHeartRate());
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }
}
