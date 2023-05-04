using Toybox.Test;

(:test)
function hrToEnergyBasicTest(logger) {
    CadanceAlgorithmDelegate.hrToenergy();
    return true;
}

(:test)
function hrToEnergyOutOfRange(logger) {
    //CadanceAlgorithmDelegate.hrToenergy(0);
    return true;
}