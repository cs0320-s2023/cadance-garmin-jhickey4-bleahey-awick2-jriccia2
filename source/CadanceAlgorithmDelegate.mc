using Toybox.Math;
using Toybox.Lang;

class CadanceAlgorithmDelegate {
  //TODO: decide whether to use user's heart rate ranges for increased accuracy

  // Computes the spotify input energy of a run based on the heart rate and
  // cadence. Heart rate is a number between 90 and 210.
  // Returns -1 as a flag for an invalid heart rate
  static function hrToEnergy(hr as Lang.Number) as Lang.Double {
    if (hr < 90 || hr > 210) {
      throw new HeartRateRangeException(hr);
    }
    var res = (hr - 90d) / (210d - 90d);
    return res * 1d;
  }

  // Computes the Spotify input energy based on the user's cadence, height
  // and gender as a metric between 0 and 1 for perceived effort expended.
  static function cadenceToEnergy(
    cadence as Lang.Number,
    height as Lang.Number,
    male as Lang.Boolean
  ) as Lang.Double {
    var avgHeight;
    if (male) {
      avgHeight = Constants.AVG_HEIGHT_MAN_INCHES;
    } else {
      avgHeight = Constants.AVG_HEIGHT_WOMAN_INCHES;
    }
    var diff = height - avgHeight;
    var cadenceOffset = diff * Constants.INCH_INCREASE_TO_CADENCE_OFFSET;
    var expectedCadence = Constants.AVG_CADENCE + cadenceOffset;
    var max = Math.round(expectedCadence * 1.1);
    var min = Math.round(expectedCadence * 0.9);
    var energy = (cadence - min) / (max - min);
    if (energy > 1) {
      energy = 1;
    } else if (energy < 0) {
      energy = 0;
    }
    return energy * 1d;
  }
}
