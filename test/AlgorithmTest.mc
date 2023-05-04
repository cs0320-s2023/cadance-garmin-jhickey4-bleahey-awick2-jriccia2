using Toybox.Test;

//Test suite for CadanceAlgorithmDelegate

var undefined;

//test typical cases for hrToEnergy
(:test)
function hrToEnergyBasicTest(logger) {
  return true;
}

//Tests out of range edge cases in hrToEnergy
(:test)
function hrToEnergyOutOfRange(logger) {
  var exceptionCaughtLow = false;
  var exceptionCaughtHigh = false;
  var exceptionCaughtUndefined = false;

  //test below range
  try {
    CadanceAlgorithmDelegate.hrToEnergy(0);
  } catch (e) {
    if (e instanceof Toybox.Lang.Exception) {
      exceptionCaughtLow = true;
    }
  }
  //test above range
  try {
    CadanceAlgorithmDelegate.hrToEnergy(211);
  } catch (e) {
    if (e instanceof Toybox.Lang.Exception) {
      exceptionCaughtHigh = true;
    }
  }
  //test undefined flag
  try {
    CadanceAlgorithmDelegate.hrToEnergy(undefined);
  } catch (e) {
    if (e instanceof Toybox.Lang.Exception) {
      exceptionCaughtUndefined = true;
    }
  }
  return exceptionCaughtLow && exceptionCaughtHigh && exceptionCaughtUndefined;
}
