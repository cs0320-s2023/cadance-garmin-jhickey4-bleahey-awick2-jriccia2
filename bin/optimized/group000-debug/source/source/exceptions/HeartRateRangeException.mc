using Toybox.Lang;

class HeartRateRangeException extends Lang.Exception {
  hidden var hr as Lang.Number = -1;

  function initialize(hr as Lang.Number) {
    Exception.initialize();
  }

  function getErrorMessage() {
    var pre_hr;
    pre_hr = hr;
    if (pre_hr == -1) {
      return "Heart rate not set";
    }
    return "Heart rate " + pre_hr + " not in range 90-210";
  }
}
