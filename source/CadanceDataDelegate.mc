using Toybox.Sensor;
using Toybox.AntPlus;
using Toybox.Math;
import Toybox.WatchUi;
using Toybox.UserProfile;

class CadanceDataDelegate {
    hidden var energy = 0;
    hidden var cadence = 0;
    hidden var heartRate = 0;

    hidden var dynamics;
    //activityinfo works too
    hidden var profile;

    function initialize() {
        //ANT+ listeners provide a more accurate reading of metrics like cadence
        //and heart rate. However, it is not standard on all watches, and doesn't
        //work on the simulator without certain setup. So, we use the watch sensors
        //as a backup.
        var listener = new AntPlus.RunningDynamicsListener();
        //profile = UserProfile.getProfile(); for official release, use this
        //also need to define male and height fields here
        dynamics = new AntPlus.RunningDynamics(listener);
    }

    function getCadence() as Toybox.Lang.Number{
        return cadence;
    }

    function getHeartRate() as Toybox.Lang.Number{
        return heartRate;
    }

    function getEnergy() as Toybox.Lang.Number{
        return energy;
    }

    function updateFields(sensorInfo as Sensor.Info) as Void {
        //on official release, remove this line and use the one in initialize()
        //TODO: surround in try catch for nullpointer, or check if null
        profile = UserProfile.getProfile();
        var male = (profile.gender == UserProfile.GENDER_MALE);
        var height = profile.height * Constants.CM_TO_INCH;
        height = Math.floor(height).toNumber();

        if(sensorInfo.heartRate != null){
            heartRate = sensorInfo.heartRate;

            var cadenceUpdated = false;
            
            //TODO: calculate energy based on cadence or heart rate or average
            //TODO: calculate tempo based on running cadence
            //TODO: handle -1 flags

            if(dynamics.getRunningDynamics() != null){
                 cadence = dynamics.getRunningDynamics().cadence;
                cadenceUpdated = true;
            } else if (sensorInfo.cadence != null){
                cadence = Math.floor(sensorInfo.cadence * 
                Constants.BIKE_TO_RUN_CAD_RATIO).toNumber();
                cadenceUpdated = true;
            }
            if(cadenceUpdated){
                energy = Constants.CADENCE_WEIGHT * CadanceAlgorithmDelegate.cadenceToEnergy(cadence, height, male) + 
                 Constants.HR_WEIGHT * CadanceAlgorithmDelegate.hrToEnergy(heartRate);

                System.println(CadanceAlgorithmDelegate.hrToEnergy(heartRate));
            }
        } else if(dynamics.getRunningDynamics() != null){
            cadence = dynamics.getRunningDynamics().cadence;
            energy = CadanceAlgorithmDelegate.cadenceToEnergy(cadence, height, male);
        } else if(sensorInfo.cadence != null){
            cadence = Math.floor(sensorInfo.cadence * 
                Constants.BIKE_TO_RUN_CAD_RATIO).toNumber();
            energy = CadanceAlgorithmDelegate.cadenceToEnergy(cadence, height, male);
        }
    }
}