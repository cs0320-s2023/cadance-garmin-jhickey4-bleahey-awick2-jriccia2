using Toybox.Lang;

class HeartRateRangeException extends Lang.Exception {
    hidden var hr as Lang.Number = -1;

    function initialize(hr as Lang.Number) {
        Exception.initialize();
        hr = hr;
    }

    function getErrorMessage() {
        if(hr == -1){
            return "Heart rate not set";
        }
        return "Heart rate " + hr + " not in range 90-210";
    }
}