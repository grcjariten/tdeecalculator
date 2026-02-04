// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Calculateur TDEE';

  @override
  String get appSubtitle =>
      'Calculez vos calories de maintien et votre objectif quotidien.';

  @override
  String get unitsLabel => 'Unités';

  @override
  String get metric => 'Métrique';

  @override
  String get imperial => 'Impérial';

  @override
  String get basics => 'Bases';

  @override
  String get gender => 'Sexe';

  @override
  String get male => 'Homme';

  @override
  String get female => 'Femme';

  @override
  String get age => 'Âge';

  @override
  String get years => 'ans';

  @override
  String get weight => 'Poids';

  @override
  String get height => 'Taille';

  @override
  String get activitySection => 'Activité';

  @override
  String get activityLevel => 'Niveau d\'activité';

  @override
  String get activitySedentary => 'Sédentaire';

  @override
  String get activityLight => 'Activité légère';

  @override
  String get activityModerate => 'Activité modérée';

  @override
  String get activityHigh => 'Activité intense';

  @override
  String get activityElite => 'Athlète avancé';

  @override
  String get bodyFatOptional => 'Masse grasse (optionnel)';

  @override
  String get bodyFatRequired => 'Masse grasse (obligatoire)';

  @override
  String get formulaSection => 'Formule';

  @override
  String get formulaLabel => 'Formule BMR';

  @override
  String get formulaHarris => 'Harris-Benedict (originale)';

  @override
  String get formulaMifflin => 'Mifflin-St Jeor';

  @override
  String get formulaKatch => 'Katch-McArdle';

  @override
  String get goalSection => 'Objectif';

  @override
  String get goal => 'Objectif';

  @override
  String get goalMaintain => 'Maintenir';

  @override
  String get goalLose => 'Perdre';

  @override
  String get goalGain => 'Gagner';

  @override
  String get calculate => 'Calculer';

  @override
  String get validationRequired => 'Obligatoire';

  @override
  String get validationInvalidNumber => 'Nombre invalide';

  @override
  String get validationOutOfRange => 'Hors limites';

  @override
  String get validationBodyFatRequired =>
      'Masse grasse obligatoire pour Katch-McArdle.';

  @override
  String get resultsTitle => 'Vos résultats';

  @override
  String get dailyTarget => 'Objectif quotidien';

  @override
  String get caloriesPerDay => 'calories par jour';

  @override
  String get weeklyTarget => 'Objectif hebdomadaire';

  @override
  String get caloriesPerWeek => 'calories par semaine';

  @override
  String get breakdown => 'Détail';

  @override
  String get formulaUsed => 'Formule utilisée';

  @override
  String get targetCalories => 'Calories cible';

  @override
  String get maintenance => 'Maintien';

  @override
  String get bmr => 'BMR';

  @override
  String get bmi => 'BMI';

  @override
  String get bmiPrime => 'BMI prime';

  @override
  String get newBmi => 'Nouveau BMI';

  @override
  String get bmiAlternatives => 'Alternatives BMI';

  @override
  String get idealWeight => 'Poids idéal';

  @override
  String get perDay => 'par jour';

  @override
  String get calories => 'calories';

  @override
  String get kgUnit => 'kg';

  @override
  String get compareFormulas => 'Comparer les formules';

  @override
  String get requiresBodyFat => 'Nécessite la masse grasse';

  @override
  String get copyResults => 'Copier';

  @override
  String get shareResults => 'Partager';

  @override
  String get resultsCopied => 'Résultats copiés';

  @override
  String get aboutTitle => 'À propos';

  @override
  String get formulasUsed => 'Formules utilisées';

  @override
  String get tdeeUsesHB =>
      '- Le TDEE utilise la formule choisie (Harris-Benedict, Mifflin-St Jeor ou Katch-McArdle).';

  @override
  String get harrisBenedictTitle => 'Harris-Benedict';

  @override
  String get menMetric => 'Hommes (Harris-Benedict)';

  @override
  String get menMetricFormula =>
      'BMR = 66.5 + (13.76 x poids kg) + (5.003 x taille cm) - (6.755 x âge)';

  @override
  String get womenMetric => 'Femmes (Harris-Benedict)';

  @override
  String get womenMetricFormula =>
      'BMR = 655 + (9.563 x poids kg) + (1.850 x taille cm) - (4.676 x âge)';

  @override
  String get mifflinTitle => 'Mifflin-St Jeor';

  @override
  String get mifflinMenFormula =>
      'Hommes : BMR = (10 x poids kg) + (6.25 x taille cm) - (5 x âge) + 5';

  @override
  String get mifflinWomenFormula =>
      'Femmes : BMR = (10 x poids kg) + (6.25 x taille cm) - (5 x âge) - 161';

  @override
  String get bodyFatNote => 'Katch-McArdle (nécessite la masse grasse) :';

  @override
  String get katchFormula => 'BMR = 370 + (21.6 x LBM)';

  @override
  String get bmiFormulasTitle => 'Formules BMI';

  @override
  String get bmiFormula => 'BMI = poids kg / taille m^2';

  @override
  String get bmiPrimeFormula => 'BMI prime = BMI / 25';

  @override
  String get newBmiFormula => 'Nouveau BMI = 1.3 x poids kg / taille m^2.5';

  @override
  String get idealWeightNote =>
      '- Le poids idéal utilise la formule de Lorenz :';

  @override
  String get lorenzMen => 'Hommes : taille cm - 100 - (taille cm - 150) / 4';

  @override
  String get lorenzWomen => 'Femmes : taille cm - 100 - (taille cm - 150) / 2';

  @override
  String get dataSafetyTitle => 'Sécurité des données';

  @override
  String get dataSafetyNoData =>
      'L\'application ne collecte pas de données personnelles. Les annonces sont diffusées par Google AdMob, qui peut collecter des identifiants de l\'appareil et des données de diagnostic. Voir la politique de confidentialité.';

  @override
  String get privacyPolicyTitle => 'Politique de confidentialité';

  @override
  String get privacyPolicyLinkLabel => 'Lien vers la politique';

  @override
  String get privacyPolicyCopy => 'Copier le lien';

  @override
  String get privacyPolicyCopied => 'Lien copié';

  @override
  String get iconCredit => 'Icônes créées avec des ressources de Flaticon.com.';
}
