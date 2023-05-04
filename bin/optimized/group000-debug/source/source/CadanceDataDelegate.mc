using Toybox.System;
using Toybox.Lang;
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
    //profile = UserProfile.getProfile(); for official release, use this
    //also need to define male and height fields here
    dynamics = new AntPlus.RunningDynamics(
      new AntPlus.RunningDynamicsListener()
    );
  }

  //Returns the cadence in SPM
  function getCadence() as Toybox.Lang.Number {
    return cadence;
  }

  //Returns the heart rate in BPM
  function getHeartRate() as Toybox.Lang.Number {
    return heartRate;
  }

  //Returns the reccomended spotify energy level
  function getEnergy() as Toybox.Lang.Number {
    return energy;
  }

  function updateFields(sensorInfo as Sensor.Info) as Void {
    var pre_profile;
    //on official release, remove this line and use the one in initialize()
    //profile will always be defined, so no need to check for null
    pre_profile = UserProfile.getProfile();
    profile = pre_profile;
    var male = pre_profile.gender == 1;
    var height;
    height = Math.floor(pre_profile.height * 0.393701).toNumber();

    if (sensorInfo.heartRate != null) {
      heartRate = sensorInfo.heartRate;

      pre_profile /*>cadenceUpdated<*/ = false;

      if (dynamics.getRunningDynamics() != null) {
        cadence = dynamics.getRunningDynamics().cadence;
        pre_profile /*>cadenceUpdated<*/ = true;
      } else if (sensorInfo.cadence != null) {
        cadence = Math.floor(sensorInfo.cadence * 1.75).toNumber();
        pre_profile /*>cadenceUpdated<*/ = true;
      }
      if (pre_profile /*>cadenceUpdated<*/) {
        try {
          energy =
            CadanceAlgorithmDelegate.cadenceToEnergy(cadence, height, male) *
              0.7 +
            CadanceAlgorithmDelegate.hrToEnergy(heartRate) * 0.3;
        } catch (e instanceof Lang /*>Toybox.Lang<*/.Exception) {
          energy = CadanceAlgorithmDelegate.cadenceToEnergy(
            cadence,
            height,
            male
          );
          System.println(e.getErrorMessage());
        }
      }
    } else if (dynamics.getRunningDynamics() != null) {
      cadence = dynamics.getRunningDynamics().cadence;
      energy = CadanceAlgorithmDelegate.cadenceToEnergy(cadence, height, male);
    } else if (sensorInfo.cadence != null) {
      cadence = Math.floor(sensorInfo.cadence * 1.75).toNumber();
      energy = CadanceAlgorithmDelegate.cadenceToEnergy(cadence, height, male);
    }
  }
}
