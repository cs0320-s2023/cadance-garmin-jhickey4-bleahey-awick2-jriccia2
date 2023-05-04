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
        var res = (hr - 90d) / (210d - 90d);
        res = (Math.round(res * 100)) / 100d;
        
        return res;
    }

    static function cadenceToEnergy(
    cadence as Lang.Number,
    height as Lang.Number,
    male as Lang.Boolean
    ) as Lang.Double {
        var avgHeight;
        if(male)
        {
            avgHeight = Constants.AVG_HEIGHT_MAN_INCHES;
        }else {
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
        return (Math.round(energy * 100d))/ 100d;
}
}