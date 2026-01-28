// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Calculadora TDEE';

  @override
  String get appSubtitle =>
      'Calcula tus calorías de mantenimiento y el objetivo diario.';

  @override
  String get unitsLabel => 'Unidades';

  @override
  String get metric => 'Métrico';

  @override
  String get imperial => 'Imperial';

  @override
  String get basics => 'Datos básicos';

  @override
  String get gender => 'Sexo';

  @override
  String get male => 'Hombre';

  @override
  String get female => 'Mujer';

  @override
  String get age => 'Edad';

  @override
  String get years => 'años';

  @override
  String get weight => 'Peso';

  @override
  String get height => 'Altura';

  @override
  String get activitySection => 'Actividad';

  @override
  String get activityLevel => 'Nivel de actividad';

  @override
  String get activitySedentary => 'Sedentario';

  @override
  String get activityLight => 'Actividad ligera';

  @override
  String get activityModerate => 'Actividad moderada';

  @override
  String get activityHigh => 'Actividad alta';

  @override
  String get activityElite => 'Atleta avanzado';

  @override
  String get bodyFatOptional => 'Grasa corporal (opcional)';

  @override
  String get goalSection => 'Objetivo';

  @override
  String get goal => 'Objetivo';

  @override
  String get goalMaintain => 'Mantener';

  @override
  String get goalLose => 'Bajar';

  @override
  String get goalGain => 'Ganar';

  @override
  String get calculate => 'Calcular';

  @override
  String get validationRequired => 'Obligatorio';

  @override
  String get validationInvalidNumber => 'Número no válido';

  @override
  String get validationOutOfRange => 'Fuera de rango';

  @override
  String get resultsTitle => 'Tus resultados';

  @override
  String get dailyTarget => 'Objetivo diario';

  @override
  String get caloriesPerDay => 'calorías por día';

  @override
  String get weeklyTarget => 'Objetivo semanal';

  @override
  String get caloriesPerWeek => 'calorías por semana';

  @override
  String get breakdown => 'Detalle';

  @override
  String get targetCalories => 'Calorías objetivo';

  @override
  String get maintenance => 'Mantenimiento';

  @override
  String get bmr => 'BMR';

  @override
  String get bmi => 'BMI';

  @override
  String get idealWeight => 'Peso ideal';

  @override
  String get perDay => 'por día';

  @override
  String get calories => 'calorías';

  @override
  String get kgUnit => 'kg';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String get formulasUsed => 'Fórmulas usadas';

  @override
  String get tdeeUsesHB => '- El TDEE usa la ecuación de Harris-Benedict.';

  @override
  String get menMetric => 'Hombres (métrico)';

  @override
  String get menMetricFormula =>
      'BMR = 66.5 + (13.76 x peso kg) + (5.003 x altura cm) - (6.755 x edad)';

  @override
  String get womenMetric => 'Mujeres (métrico)';

  @override
  String get womenMetricFormula =>
      'BMR = 655 + (9.563 x peso kg) + (1.850 x altura cm) - (4.676 x edad)';

  @override
  String get bodyFatNote =>
      '- Si se indica grasa corporal, el TDEE usa Katch-McArdle:';

  @override
  String get katchFormula => 'BMR = 370 + (21.6 x LBM)';

  @override
  String get idealWeightNote => '- El peso ideal usa la fórmula de Lorenz:';

  @override
  String get lorenzMen => 'Hombres: altura cm - 100 - (altura cm - 150) / 4';

  @override
  String get lorenzWomen => 'Mujeres: altura cm - 100 - (altura cm - 150) / 2';

  @override
  String get dataSafetyTitle => 'Seguridad de los datos';

  @override
  String get dataSafetyNoData =>
      'La app no recopila datos personales. Los anuncios se sirven mediante Google AdMob, que puede recopilar identificadores del dispositivo y datos de diagnóstico. Consulta la política de privacidad.';

  @override
  String get privacyPolicyTitle => 'Política de privacidad';

  @override
  String get privacyPolicyLinkLabel => 'Enlace a la política';

  @override
  String get privacyPolicyCopy => 'Copiar enlace';

  @override
  String get privacyPolicyCopied => 'Enlace copiado';

  @override
  String get iconCredit => 'Iconos creados con recursos de Flaticon.com.';
}
