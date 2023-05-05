using Toybox.Test;

//Test suite for CadanceAlgorithmDelegate

var undefined;

//test typical cases for hrToEnergy
(:test)
function hrToEnergyBasicTest(logger) {
  var smallEnergy = CadanceAlgorithmDelegate.hrToEnergy(100);
  var medEnergy = CadanceAlgorithmDelegate.hrToEnergy(150);
  var highEnergy = CadanceAlgorithmDelegate.hrToEnergy(200);

  var inRangeSmall = smallEnergy > 0d && smallEnergy < 1d;
  var inRangeMed = medEnergy > 0d && medEnergy < 1d;
  var inRangeHigh = highEnergy > 0d && highEnergy < 1d;
  var valuesCorrect =
    smallEnergy == TestConstants.EXPECTED_ENERGY_1 &&
    medEnergy == TestConstants.EXPECTED_ENERGY_2 &&
    highEnergy == TestConstants.EXPECTED_ENERGY_3;

  return inRangeSmall && inRangeMed && inRangeHigh && valuesCorrect;
}

//test edge cases for energyToHr
(:test)
function hrToEnergyEdgeCaseTest(logger) {
  var minIsZero = CadanceAlgorithmDelegate.hrToEnergy(90) == 0d;
  var maxIsOne = CadanceAlgorithmDelegate.hrToEnergy(210) == 1d;

  return minIsZero && maxIsOne;
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

//test typical cases for cadenceToEnergy
(:test)
function cadenceToEnergyBasicTest(logger) {
  var male = true;
  var height = 70;
  var smallEnergy = CadanceAlgorithmDelegate.cadenceToEnergy(155, height, male);
  var medEnergy = CadanceAlgorithmDelegate.cadenceToEnergy(165, height, male);
  var highEnergy = CadanceAlgorithmDelegate.cadenceToEnergy(175, height, male);
  var veryHighEnergy = CadanceAlgorithmDelegate.cadenceToEnergy(
    180,
    height,
    male
  );

  logger.debug("smallEnergy: " + smallEnergy);
  logger.debug("medEnergy: " + medEnergy);
  logger.debug("highEnergy: " + highEnergy);
  logger.debug("veryHighEnergy: " + veryHighEnergy);

  var inRangeSmall = smallEnergy > 0d && smallEnergy < 1d;
  var inRangeMed = medEnergy > 0d && medEnergy < 1d;
  var inRangeHigh = highEnergy > 0d && highEnergy < 1d;
  var valuesCorrect =
    smallEnergy == TestConstants.EXPECTED_ENERGY_4 &&
    medEnergy == TestConstants.EXPECTED_ENERGY_5 &&
    highEnergy == TestConstants.EXPECTED_ENERGY_6 &&
    veryHighEnergy == TestConstants.EXPECTED_ENERGY_7;
  return inRangeSmall && inRangeMed && inRangeHigh && valuesCorrect;
}

//test edge cases for cadenceToEnergy
(:test)
function cadenceToEnergyEdgeCaseTest(logger) {
  var minIsZero = CadanceAlgorithmDelegate.cadenceToEnergy(150, 70, true) == 0d;
  var maxIsOne = CadanceAlgorithmDelegate.cadenceToEnergy(185, 70, true) == 1d;

  return minIsZero && maxIsOne;
}
