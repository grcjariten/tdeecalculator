import 'dart:math';

enum BmrFormula { harrisBenedict, mifflinStJeor, katchMcArdle }

class FormulaEstimate {
  const FormulaEstimate({
    required this.formula,
    required this.bmr,
    required this.tdee,
    required this.targetTdee,
  });

  final BmrFormula formula;
  final double? bmr;
  final double? tdee;
  final double? targetTdee;
}

class CalculationResults {
  const CalculationResults({
    required this.primaryFormula,
    required this.bmr,
    required this.tdee,
    required this.targetTdee,
    required this.bmi,
    required this.bmiPrime,
    required this.newBmi,
    required this.idealWeight,
    required this.comparisons,
  });

  final BmrFormula primaryFormula;
  final double bmr;
  final double tdee;
  final double targetTdee;
  final double bmi;
  final double bmiPrime;
  final double newBmi;
  final double idealWeight;
  final List<FormulaEstimate> comparisons;
}

double _activityMultiplier(String selectedActivity) {
  switch (selectedActivity) {
    case 'Sedentary':
      return 1.2;
    case 'Light':
      return 1.375;
    case 'Moderate':
      return 1.55;
    case 'High':
      return 1.725;
    case 'Elite':
      return 1.9;
  }
  return 1.2;
}

double _goalAdjusted(double tdee, String selectedGoal) {
  switch (selectedGoal) {
    case 'Lose':
      return tdee * 0.8;
    case 'Gain':
      return tdee + 200;
  }
  return tdee;
}

double? calculateBmr({
  required BmrFormula formula,
  required bool female,
  required double weightKg,
  required double heightCm,
  required double ageYears,
  required double bodyFatPercent,
}) {
  switch (formula) {
    case BmrFormula.harrisBenedict:
      if (female) {
        return 655.0955 +
            (9.5634 * weightKg) +
            (1.8496 * heightCm) -
            (4.6756 * ageYears);
      }
      return 66.4730 +
          (13.7516 * weightKg) +
          (5.0033 * heightCm) -
          (6.7550 * ageYears);
    case BmrFormula.mifflinStJeor:
      final base = (10 * weightKg) + (6.25 * heightCm) - (5 * ageYears);
      return female ? base - 161 : base + 5;
    case BmrFormula.katchMcArdle:
      if (bodyFatPercent <= 0) {
        return null;
      }
      final leanBodyMass = weightKg * (1 - bodyFatPercent / 100);
      return 370 + (21.6 * leanBodyMass);
  }
}

CalculationResults calculateResults({
  required bool female,
  required double ageYears,
  required double weightKg,
  required double heightCm,
  required double bodyFatPercent,
  required String selectedActivity,
  required String selectedGoal,
  required BmrFormula selectedFormula,
}) {
  final heightMeters = heightCm / 100;
  final bmi = weightKg / pow(heightMeters, 2);
  final bmiPrime = bmi / 25;
  final newBmi = 1.3 * weightKg / pow(heightMeters, 2.5);

  final idealWeight = female
      ? heightCm - 100 - (heightCm - 150) / 2
      : heightCm - 100 - (heightCm - 150) / 4;

  final activityFactor = _activityMultiplier(selectedActivity);

  final primaryBmr = calculateBmr(
        formula: selectedFormula,
        female: female,
        weightKg: weightKg,
        heightCm: heightCm,
        ageYears: ageYears,
        bodyFatPercent: bodyFatPercent,
      ) ??
      calculateBmr(
        formula: BmrFormula.harrisBenedict,
        female: female,
        weightKg: weightKg,
        heightCm: heightCm,
        ageYears: ageYears,
        bodyFatPercent: bodyFatPercent,
      )!;

  final tdee = primaryBmr * activityFactor;
  final targetTdee = _goalAdjusted(tdee, selectedGoal);

  final comparisons = BmrFormula.values
      .map(
        (formula) {
          final bmr = calculateBmr(
            formula: formula,
            female: female,
            weightKg: weightKg,
            heightCm: heightCm,
            ageYears: ageYears,
            bodyFatPercent: bodyFatPercent,
          );
          if (bmr == null) {
            return FormulaEstimate(
              formula: formula,
              bmr: null,
              tdee: null,
              targetTdee: null,
            );
          }
          final tdee = bmr * activityFactor;
          final target = _goalAdjusted(tdee, selectedGoal);
          return FormulaEstimate(
            formula: formula,
            bmr: bmr,
            tdee: tdee,
            targetTdee: target,
          );
        },
      )
      .toList();

  return CalculationResults(
    primaryFormula: selectedFormula,
    bmr: primaryBmr,
    tdee: tdee,
    targetTdee: targetTdee,
    bmi: bmi,
    bmiPrime: bmiPrime,
    newBmi: newBmi,
    idealWeight: idealWeight,
    comparisons: comparisons,
  );
}

double imperialConversion(String? selectedHeight) {
  switch (selectedHeight) {
    case '4ft 7in':
      return 139.7;
    case '4ft 8in':
      return 142.24;
    case '4ft 9in':
      return 144.78;
    case '4ft 10in':
      return 147.32;
    case '4ft 11in':
      return 149.86;
    case '5ft 0in':
      return 152.4;
    case '5ft 1in':
      return 154.94;
    case '5ft 2in':
      return 157.48;
    case '5ft 3in':
      return 160.02;
    case '5ft 4in':
      return 162.56;
    case '5ft 5in':
      return 165.1;
    case '5ft 6in':
      return 167.64;
    case '5ft 7in':
      return 170.18;
    case '5ft 8in':
      return 172.72;
    case '5ft 9in':
      return 175.26;
    case '5ft 10in':
      return 177.8;
    case '5ft 11in':
      return 180.34;
    case '6ft 0in':
      return 182.88;
    case '6ft 1in':
      return 185.42;
    case '6ft 2in':
      return 187.96;
    case '6ft 3in':
      return 190.5;
    case '6ft 4in':
      return 193.04;
    case '6ft 5in':
      return 195.58;
    case '6ft 6in':
      return 198.12;
    case '6ft 7in':
      return 200.66;
    case '6ft 8in':
      return 203.2;
    case '6ft 9in':
      return 205.74;
    case '6ft 10in':
      return 208.28;
    case '6ft 11in':
      return 210.82;
    case '7ft 0in':
      return 213.36;
  }
  return 154.94;
}
