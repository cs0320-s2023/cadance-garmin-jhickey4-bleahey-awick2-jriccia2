import Toybox.Lang;

// Constants used in the app.

class Constants {
  static const AVG_HEIGHT_MAN_INCHES = 69;
  static const AVG_HEIGHT_WOMAN_INCHES = 64;
  static const INCH_INCREASE_TO_CADENCE_OFFSET = -3;
  static const CM_TO_INCH = 0.393701;

  // How much cadence is weighted in energy calculations.
  static const CADENCE_WEIGHT = 0.7;
  // How much heart rate is weighted in energy calculations.
  static const HR_WEIGHT = 0.3;
  static const AVG_CADENCE = 170;
  // The ratio temporarily used to convert bike cadence to run cadence.
  static const BIKE_TO_RUN_CAD_RATIO = 1.75;
}
