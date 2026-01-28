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
  String get targetCalories => 'Calories cible';

  @override
  String get maintenance => 'Maintien';

  @override
  String get bmr => 'BMR';

  @override
  String get bmi => 'BMI';

  @override
  String get idealWeight => 'Poids idéal';

  @override
  String get perDay => 'par jour';

  @override
  String get calories => 'calories';

  @override
  String get kgUnit => 'kg';

  @override
  String get aboutTitle => 'À propos';

  @override
  String get formulasUsed => 'Formules utilisées';

  @override
  String get tdeeUsesHB => '- Le TDEE utilise l\'équation de Harris-Benedict.';

  @override
  String get menMetric => 'Hommes (métrique)';

  @override
  String get menMetricFormula =>
      'BMR = 66.5 + (13.76 x poids kg) + (5.003 x taille cm) - (6.755 x âge)';

  @override
  String get womenMetric => 'Femmes (métrique)';

  @override
  String get womenMetricFormula =>
      'BMR = 655 + (9.563 x poids kg) + (1.850 x taille cm) - (4.676 x âge)';

  @override
  String get bodyFatNote =>
      '- Si la masse grasse est renseignée, le TDEE utilise Katch-McArdle :';

  @override
  String get katchFormula => 'BMR = 370 + (21.6 x LBM)';

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
