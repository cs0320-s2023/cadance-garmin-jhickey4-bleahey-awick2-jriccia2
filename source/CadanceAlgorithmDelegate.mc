using Toybox.Math;
using Toybox.Lang;

class CadanceAlgorithmDelegate {
    function hrToEnergy(hr as Lang.Number) as Lang.Number {
        if (hr < 90 || hr > 210) {
            //out of range: throw error
        }
        var res = (hr - 90) / (210 - 90);
        res = Math.round(res * 100) / 100;
        return res;
    }

    function getValidTempos(tempo as Lang.Number) as Lang.Array {
        var res = [];
        res.add(tempo);
        res.add(Math.round(tempo / 2));
        res.add(Math.round(tempo * (2 / 3)));
        return res;
    }

    function cadenceToEnergy(
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
        return Math.round(energy * 100) / 100;
}
}