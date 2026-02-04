// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Calcolatore TDEE';

  @override
  String get appSubtitle =>
      'Calcola le calorie di mantenimento e il target giornaliero.';

  @override
  String get unitsLabel => 'Unità';

  @override
  String get metric => 'Metrico';

  @override
  String get imperial => 'Imperiale';

  @override
  String get basics => 'Dati base';

  @override
  String get gender => 'Sesso';

  @override
  String get male => 'Uomo';

  @override
  String get female => 'Donna';

  @override
  String get age => 'Età';

  @override
  String get years => 'anni';

  @override
  String get weight => 'Peso';

  @override
  String get height => 'Altezza';

  @override
  String get activitySection => 'Attività';

  @override
  String get activityLevel => 'Livello di attività';

  @override
  String get activitySedentary => 'Sedentario';

  @override
  String get activityLight => 'Attività leggera';

  @override
  String get activityModerate => 'Attività moderata';

  @override
  String get activityHigh => 'Attività intensa';

  @override
  String get activityElite => 'Atleta evoluto';

  @override
  String get bodyFatOptional => 'Massa grassa (opzionale)';

  @override
  String get bodyFatRequired => 'Massa grassa (obbligatoria)';

  @override
  String get formulaSection => 'Formula';

  @override
  String get formulaLabel => 'Formula BMR';

  @override
  String get formulaHarris => 'Harris-Benedict (originale)';

  @override
  String get formulaMifflin => 'Mifflin-St Jeor';

  @override
  String get formulaKatch => 'Katch-McArdle';

  @override
  String get goalSection => 'Obiettivo';

  @override
  String get goal => 'Obiettivo';

  @override
  String get goalMaintain => 'Mantenimento';

  @override
  String get goalLose => 'Dimagrire';

  @override
  String get goalGain => 'Aumentare';

  @override
  String get calculate => 'Calcola';

  @override
  String get validationRequired => 'Obbligatorio';

  @override
  String get validationInvalidNumber => 'Numero non valido';

  @override
  String get validationOutOfRange => 'Fuori intervallo';

  @override
  String get validationBodyFatRequired =>
      'Massa grassa obbligatoria per Katch-McArdle.';

  @override
  String get resultsTitle => 'I tuoi risultati';

  @override
  String get dailyTarget => 'Target giornaliero';

  @override
  String get caloriesPerDay => 'calorie al giorno';

  @override
  String get weeklyTarget => 'Target settimanale';

  @override
  String get caloriesPerWeek => 'calorie a settimana';

  @override
  String get breakdown => 'Dettagli';

  @override
  String get formulaUsed => 'Formula usata';

  @override
  String get targetCalories => 'Calorie target';

  @override
  String get maintenance => 'Mantenimento';

  @override
  String get bmr => 'BMR';

  @override
  String get bmi => 'BMI';

  @override
  String get bmiPrime => 'BMI prime';

  @override
  String get newBmi => 'Nuovo BMI';

  @override
  String get bmiAlternatives => 'Alternative BMI';

  @override
  String get idealWeight => 'Peso ideale';

  @override
  String get perDay => 'al giorno';

  @override
  String get calories => 'calorie';

  @override
  String get kgUnit => 'kg';

  @override
  String get compareFormulas => 'Confronta formule';

  @override
  String get requiresBodyFat => 'Richiede la massa grassa';

  @override
  String get copyResults => 'Copia';

  @override
  String get shareResults => 'Condividi';

  @override
  String get resultsCopied => 'Risultati copiati';

  @override
  String get aboutTitle => 'Info';

  @override
  String get formulasUsed => 'Formule utilizzate';

  @override
  String get tdeeUsesHB =>
      '- Il TDEE usa la formula selezionata (Harris-Benedict, Mifflin-St Jeor o Katch-McArdle).';

  @override
  String get harrisBenedictTitle => 'Harris-Benedict';

  @override
  String get menMetric => 'Uomini (Harris-Benedict)';

  @override
  String get menMetricFormula =>
      'BMR = 66.5 + (13.76 x peso kg) + (5.003 x altezza cm) - (6.755 x età)';

  @override
  String get womenMetric => 'Donne (Harris-Benedict)';

  @override
  String get womenMetricFormula =>
      'BMR = 655 + (9.563 x peso kg) + (1.850 x altezza cm) - (4.676 x età)';

  @override
  String get mifflinTitle => 'Mifflin-St Jeor';

  @override
  String get mifflinMenFormula =>
      'Uomini: BMR = (10 x peso kg) + (6.25 x altezza cm) - (5 x età) + 5';

  @override
  String get mifflinWomenFormula =>
      'Donne: BMR = (10 x peso kg) + (6.25 x altezza cm) - (5 x età) - 161';

  @override
  String get bodyFatNote => 'Katch-McArdle (richiede massa grassa):';

  @override
  String get katchFormula => 'BMR = 370 + (21.6 x LBM)';

  @override
  String get bmiFormulasTitle => 'Formule BMI';

  @override
  String get bmiFormula => 'BMI = peso kg / altezza m^2';

  @override
  String get bmiPrimeFormula => 'BMI prime = BMI / 25';

  @override
  String get newBmiFormula => 'Nuovo BMI = 1.3 x peso kg / altezza m^2.5';

  @override
  String get idealWeightNote => '- Il peso ideale usa la formula di Lorenz:';

  @override
  String get lorenzMen => 'Uomini: altezza cm - 100 - (altezza cm - 150) / 4';

  @override
  String get lorenzWomen => 'Donne: altezza cm - 100 - (altezza cm - 150) / 2';

  @override
  String get dataSafetyTitle => 'Sicurezza dei dati';

  @override
  String get dataSafetyNoData =>
      'L\'app non raccoglie dati personali. Gli annunci sono forniti da Google AdMob, che può raccogliere identificativi del dispositivo e dati diagnostici. Vedi la privacy policy.';

  @override
  String get privacyPolicyTitle => 'Privacy policy';

  @override
  String get privacyPolicyLinkLabel => 'Link privacy policy';

  @override
  String get privacyPolicyCopy => 'Copia link';

  @override
  String get privacyPolicyCopied => 'Link copiato';

  @override
  String get iconCredit => 'Icone create con risorse di Flaticon.com.';
}
