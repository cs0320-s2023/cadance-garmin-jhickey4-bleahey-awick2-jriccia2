using Toybox.Test;

var undefined;

(:test)
function hrToEnergyBasicTest(logger) {
    
    return true;
}

(:test)
function hrToEnergyOutOfRange(logger) {
    var exceptionCaughtLow = false;
    var exceptionCaughtHigh = false;
    var exceptionCaughtUndefined = false;

    try{
        CadanceAlgorithmDelegate.hrToEnergy(0);
    } catch (e) {
        if(e instanceof Toybox.Lang.Exception) {
            exceptionCaughtLow = true;
        }
    }

    try{
        CadanceAlgorithmDelegate.hrToEnergy(211);
    } catch (e) {
        if(e instanceof Toybox.Lang.Exception) {
            exceptionCaughtHigh = true;
        }
    }

    try{
        CadanceAlgorithmDelegate.hrToEnergy(-1);
    } catch (e) {
        if(e instanceof Toybox.Lang.Exception) {
            exceptionCaughtUndefined = true;
        }
    }

    return exceptionCaughtLow && exceptionCaughtHigh && exceptionCaughtUndefined;
}