using Toybox.Lang;

// This is a custom exception that we can throw when we want to
// indicate that the heart rate is not in the range 90-210.
class HeartRateRangeException extends Lang.Exception {
  // This is the heart rate that was out of range. If not defined, then
  // the heart rate is set to -1.
  hidden var hr as Lang.Number = -1;

  function initialize(hr as Lang.Number) {
    Exception.initialize();
    hr = hr;
  }

  // This is a custom message that we can use to display the
  // error message to the user.
  function getErrorMessage() {
    //flag for no heart undefined
    if (hr == -1) {
      return "Heart rate not set";
    }
    return "Heart rate " + hr + " not in range 90-210";
  }
}
