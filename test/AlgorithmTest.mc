using Toybox.Test;

(:test)
function hrToEnergyBasicTest(logger) {
    CadanceAlgorithmDelegate.hrToenergy();
    return true;
}

(:test)
function hrToEnergyOutOfRange(logger) {
    var exceptionCaughtLow = false;
    var exceptionCaughtHigh = false;
    var exceptionCaughtUndefined = false;
    
    // try {
    //     CadanceAlgorithmDelegate.hrToenergy(0);
    // } catch (e instanceof Toybox.Lang.Exception) {
    //     if(e instance of HeartRateRangeException) {
    //         exceptionCaughtLow = true;
    //     }
    // }
    // try {
    //     CadanceAlgorithmDelegate.hrToenergy(211);
    // } catch (e  instanceof Toybox.Lang.Exception) {
    //     if(e instance of HeartRateRangeException) {
    //         exceptionCaughtHigh = true;
    //     }
    // }
    // try{
    //     CadanceAlgorithmDelegate.hrToenergy(null);
    // } catch (e instanceof Toybox.Lang.Exception) {
    //     if(e instance of HeartRateRangeException) {
    //         exceptionCaughtUndefined = true;
    //     }
    // }

    return exceptionCaughtLow && exceptionCaughtHigh && exceptionCaughtUndefined;
}