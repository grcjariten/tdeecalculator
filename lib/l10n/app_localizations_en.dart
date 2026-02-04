// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'TDEE Calculator';

  @override
  String get appSubtitle => 'Find your maintenance calories and daily target.';

  @override
  String get unitsLabel => 'Units';

  @override
  String get metric => 'Metric';

  @override
  String get imperial => 'Imperial';

  @override
  String get basics => 'Basics';

  @override
  String get gender => 'Gender';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get age => 'Age';

  @override
  String get years => 'years';

  @override
  String get weight => 'Weight';

  @override
  String get height => 'Height';

  @override
  String get activitySection => 'Activity';

  @override
  String get activityLevel => 'Activity level';

  @override
  String get activitySedentary => 'Sedentary';

  @override
  String get activityLight => 'Light activity';

  @override
  String get activityModerate => 'Moderate activity';

  @override
  String get activityHigh => 'High activity';

  @override
  String get activityElite => 'Elite athlete';

  @override
  String get bodyFatOptional => 'Body fat (optional)';

  @override
  String get bodyFatRequired => 'Body fat (required)';

  @override
  String get formulaSection => 'Formula';

  @override
  String get formulaLabel => 'BMR formula';

  @override
  String get formulaHarris => 'Harris-Benedict (original)';

  @override
  String get formulaMifflin => 'Mifflin-St Jeor';

  @override
  String get formulaKatch => 'Katch-McArdle';

  @override
  String get goalSection => 'Goal';

  @override
  String get goal => 'Goal';

  @override
  String get goalMaintain => 'Maintain weight';

  @override
  String get goalLose => 'Lose weight';

  @override
  String get goalGain => 'Gain weight';

  @override
  String get calculate => 'Calculate';

  @override
  String get validationRequired => 'Required';

  @override
  String get validationInvalidNumber => 'Invalid number';

  @override
  String get validationOutOfRange => 'Out of range';

  @override
  String get validationBodyFatRequired =>
      'Body fat required for Katch-McArdle.';

  @override
  String get resultsTitle => 'Your results';

  @override
  String get dailyTarget => 'Daily target';

  @override
  String get caloriesPerDay => 'calories per day';

  @override
  String get weeklyTarget => 'Weekly target';

  @override
  String get caloriesPerWeek => 'calories per week';

  @override
  String get breakdown => 'Breakdown';

  @override
  String get formulaUsed => 'Formula used';

  @override
  String get targetCalories => 'Target calories';

  @override
  String get maintenance => 'Maintenance';

  @override
  String get bmr => 'BMR';

  @override
  String get bmi => 'BMI';

  @override
  String get bmiPrime => 'BMI prime';

  @override
  String get newBmi => 'New BMI';

  @override
  String get bmiAlternatives => 'BMI alternatives';

  @override
  String get idealWeight => 'Ideal weight';

  @override
  String get perDay => 'per day';

  @override
  String get calories => 'calories';

  @override
  String get kgUnit => 'kg';

  @override
  String get compareFormulas => 'Compare formulas';

  @override
  String get requiresBodyFat => 'Requires body fat';

  @override
  String get copyResults => 'Copy';

  @override
  String get shareResults => 'Share';

  @override
  String get resultsCopied => 'Results copied';

  @override
  String get aboutTitle => 'About';

  @override
  String get formulasUsed => 'Formulas used';

  @override
  String get tdeeUsesHB =>
      '- TDEE uses the formula you select (Harris-Benedict, Mifflin-St Jeor, or Katch-McArdle).';

  @override
  String get harrisBenedictTitle => 'Harris-Benedict';

  @override
  String get menMetric => 'Men (Harris-Benedict)';

  @override
  String get menMetricFormula =>
      'BMR = 66.5 + (13.76 x weight kg) + (5.003 x height cm) - (6.755 x age)';

  @override
  String get womenMetric => 'Women (Harris-Benedict)';

  @override
  String get womenMetricFormula =>
      'BMR = 655 + (9.563 x weight kg) + (1.850 x height cm) - (4.676 x age)';

  @override
  String get mifflinTitle => 'Mifflin-St Jeor';

  @override
  String get mifflinMenFormula =>
      'Men: BMR = (10 x weight kg) + (6.25 x height cm) - (5 x age) + 5';

  @override
  String get mifflinWomenFormula =>
      'Women: BMR = (10 x weight kg) + (6.25 x height cm) - (5 x age) - 161';

  @override
  String get bodyFatNote => 'Katch-McArdle (requires body fat):';

  @override
  String get katchFormula => 'BMR = 370 + (21.6 x LBM)';

  @override
  String get bmiFormulasTitle => 'BMI formulas';

  @override
  String get bmiFormula => 'BMI = weight kg / height m^2';

  @override
  String get bmiPrimeFormula => 'BMI prime = BMI / 25';

  @override
  String get newBmiFormula => 'New BMI = 1.3 x weight kg / height m^2.5';

  @override
  String get idealWeightNote => '- Ideal weight uses the Lorenz formula:';

  @override
  String get lorenzMen => 'Men: height cm - 100 - (height cm - 150) / 4';

  @override
  String get lorenzWomen => 'Women: height cm - 100 - (height cm - 150) / 2';

  @override
  String get dataSafetyTitle => 'Data safety';

  @override
  String get dataSafetyNoData =>
      'The app itself does not collect personal data. Ads are served by Google AdMob, which may collect device identifiers and diagnostics. See the privacy policy for details.';

  @override
  String get privacyPolicyTitle => 'Privacy policy';

  @override
  String get privacyPolicyLinkLabel => 'Privacy policy link';

  @override
  String get privacyPolicyCopy => 'Copy link';

  @override
  String get privacyPolicyCopied => 'Link copied';

  @override
  String get iconCredit =>
      'Icon assets designed with resources from Flaticon.com.';
}
