using Toybox.Sensor;
using Toybox.AntPlus;
using Toybox.Math;
import Toybox.WatchUi;

class CadanceDataDelegate {
    hidden var bpm = 0;
    hidden var cadence = 0;
    hidden var heartRate = 0;

    hidden var dynamics;
    hidden var watchView;
    //activityinfo works too

    function initialize(view as CadanceView) {
        //ANT+ listeners provide a more accurate reading of metrics like cadence
        //and heart rate. However, it is not standard on all watches, and doesn't
        //work on the simulator without certain setup. So, we use the watch sensors
        //as a backup.
        var listener = new AntPlus.RunningDynamicsListener();
        dynamics = new AntPlus.RunningDynamics(listener);

        view  = watchView;
    }

    function getBPM() as Toybox.Lang.Number{
        return bpm;
    }

    function getCadence() as Toybox.Lang.Number{
        return cadence;
    }

    function getHeartRate() as Toybox.Lang.Number{
        return heartRate;
    }

    function updateFields(sensorInfo as Sensor.Info) as Void {
        if(sensorInfo.heartRate != null){
            heartRate = sensorInfo.heartRate;

            if(dynamics.getRunningDynamics() != null){
                 cadence = dynamics.getRunningDynamics().cadence;
            } else if (sensorInfo.cadence != null){
                cadence = Math.floor(sensorInfo.cadence * 1.75).toNumber();
            }
        }
    }
}