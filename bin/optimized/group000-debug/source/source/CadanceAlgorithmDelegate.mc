using Toybox.Math;
using Toybox.Lang;

class CadanceAlgorithmDelegate {
  //TODO: decide whether to use their heart rate ranges to make the energy more accurate
  //Computes the energy of a run based on the heart rate and cadence
  //Heart rate is a number between 90 and 210
  //retuns -1 as a flag for an invalid heart rate
  static function hrToEnergy(hr as Lang.Number) as Lang.Double {
    if (hr < 90 || hr > 210) {
      throw new HeartRateRangeException(hr);
    }
    return Math.round(((hr - 90d) / 120d) * 100) / 100d;
  }

  static function cadenceToEnergy(
    cadence as Lang.Number,
    height as Lang.Number,
    male as Lang.Boolean
  ) as Lang.Double {
    if (male) {
      male /*>avgHeight<*/ = 69;
    } else {
      male /*>avgHeight<*/ = 64;
    }
    male /*>expectedCadence<*/ = (height - male /*>avgHeight<*/) * -3 + 170;
    height /*>min<*/ = Math.round(male /*>expectedCadence<*/ * 0.9);
    height /*>energy<*/ =
      (cadence - height /*>min<*/) /
      (Math.round(male /*>expectedCadence<*/ * 1.1) - height /*>min<*/);
    if (height /*>energy<*/ > 1) {
      height /*>energy<*/ = 1;
    } else if (height /*>energy<*/ < 0) {
      height /*>energy<*/ = 0;
    }
    male /*>pre_100d<*/ = 100d;
    return (
      Math.round(height /*>energy<*/ * male /*>pre_100d<*/) /
      male /*>pre_100d<*/
    );
  }
}
