import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'TDEE Calculator'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find your maintenance calories and daily target.'**
  String get appSubtitle;

  /// No description provided for @unitsLabel.
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get unitsLabel;

  /// No description provided for @metric.
  ///
  /// In en, this message translates to:
  /// **'Metric'**
  String get metric;

  /// No description provided for @imperial.
  ///
  /// In en, this message translates to:
  /// **'Imperial'**
  String get imperial;

  /// No description provided for @basics.
  ///
  /// In en, this message translates to:
  /// **'Basics'**
  String get basics;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'years'**
  String get years;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// No description provided for @activitySection.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activitySection;

  /// No description provided for @activityLevel.
  ///
  /// In en, this message translates to:
  /// **'Activity level'**
  String get activityLevel;

  /// No description provided for @activitySedentary.
  ///
  /// In en, this message translates to:
  /// **'Sedentary'**
  String get activitySedentary;

  /// No description provided for @activityLight.
  ///
  /// In en, this message translates to:
  /// **'Light activity'**
  String get activityLight;

  /// No description provided for @activityModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate activity'**
  String get activityModerate;

  /// No description provided for @activityHigh.
  ///
  /// In en, this message translates to:
  /// **'High activity'**
  String get activityHigh;

  /// No description provided for @activityElite.
  ///
  /// In en, this message translates to:
  /// **'Elite athlete'**
  String get activityElite;

  /// No description provided for @bodyFatOptional.
  ///
  /// In en, this message translates to:
  /// **'Body fat (optional)'**
  String get bodyFatOptional;

  /// No description provided for @goalSection.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goalSection;

  /// No description provided for @goal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goal;

  /// No description provided for @goalMaintain.
  ///
  /// In en, this message translates to:
  /// **'Maintain weight'**
  String get goalMaintain;

  /// No description provided for @goalLose.
  ///
  /// In en, this message translates to:
  /// **'Lose weight'**
  String get goalLose;

  /// No description provided for @goalGain.
  ///
  /// In en, this message translates to:
  /// **'Gain weight'**
  String get goalGain;

  /// No description provided for @calculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculate;

  /// No description provided for @validationRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get validationRequired;

  /// No description provided for @validationInvalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid number'**
  String get validationInvalidNumber;

  /// No description provided for @validationOutOfRange.
  ///
  /// In en, this message translates to:
  /// **'Out of range'**
  String get validationOutOfRange;

  /// No description provided for @resultsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your results'**
  String get resultsTitle;

  /// No description provided for @dailyTarget.
  ///
  /// In en, this message translates to:
  /// **'Daily target'**
  String get dailyTarget;

  /// No description provided for @caloriesPerDay.
  ///
  /// In en, this message translates to:
  /// **'calories per day'**
  String get caloriesPerDay;

  /// No description provided for @weeklyTarget.
  ///
  /// In en, this message translates to:
  /// **'Weekly target'**
  String get weeklyTarget;

  /// No description provided for @caloriesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'calories per week'**
  String get caloriesPerWeek;

  /// No description provided for @breakdown.
  ///
  /// In en, this message translates to:
  /// **'Breakdown'**
  String get breakdown;

  /// No description provided for @targetCalories.
  ///
  /// In en, this message translates to:
  /// **'Target calories'**
  String get targetCalories;

  /// No description provided for @maintenance.
  ///
  /// In en, this message translates to:
  /// **'Maintenance'**
  String get maintenance;

  /// No description provided for @bmr.
  ///
  /// In en, this message translates to:
  /// **'BMR'**
  String get bmr;

  /// No description provided for @bmi.
  ///
  /// In en, this message translates to:
  /// **'BMI'**
  String get bmi;

  /// No description provided for @idealWeight.
  ///
  /// In en, this message translates to:
  /// **'Ideal weight'**
  String get idealWeight;

  /// No description provided for @perDay.
  ///
  /// In en, this message translates to:
  /// **'per day'**
  String get perDay;

  /// No description provided for @calories.
  ///
  /// In en, this message translates to:
  /// **'calories'**
  String get calories;

  /// No description provided for @kgUnit.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kgUnit;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// No description provided for @formulasUsed.
  ///
  /// In en, this message translates to:
  /// **'Formulas used'**
  String get formulasUsed;

  /// No description provided for @tdeeUsesHB.
  ///
  /// In en, this message translates to:
  /// **'- TDEE uses the original Harris-Benedict equation.'**
  String get tdeeUsesHB;

  /// No description provided for @menMetric.
  ///
  /// In en, this message translates to:
  /// **'Men (metric)'**
  String get menMetric;

  /// No description provided for @menMetricFormula.
  ///
  /// In en, this message translates to:
  /// **'BMR = 66.5 + (13.76 x weight kg) + (5.003 x height cm) - (6.755 x age)'**
  String get menMetricFormula;

  /// No description provided for @womenMetric.
  ///
  /// In en, this message translates to:
  /// **'Women (metric)'**
  String get womenMetric;

  /// No description provided for @womenMetricFormula.
  ///
  /// In en, this message translates to:
  /// **'BMR = 655 + (9.563 x weight kg) + (1.850 x height cm) - (4.676 x age)'**
  String get womenMetricFormula;

  /// No description provided for @bodyFatNote.
  ///
  /// In en, this message translates to:
  /// **'- When body fat is provided, TDEE uses Katch-McArdle:'**
  String get bodyFatNote;

  /// No description provided for @katchFormula.
  ///
  /// In en, this message translates to:
  /// **'BMR = 370 + (21.6 x LBM)'**
  String get katchFormula;

  /// No description provided for @idealWeightNote.
  ///
  /// In en, this message translates to:
  /// **'- Ideal weight uses the Lorenz formula:'**
  String get idealWeightNote;

  /// No description provided for @lorenzMen.
  ///
  /// In en, this message translates to:
  /// **'Men: height cm - 100 - (height cm - 150) / 4'**
  String get lorenzMen;

  /// No description provided for @lorenzWomen.
  ///
  /// In en, this message translates to:
  /// **'Women: height cm - 100 - (height cm - 150) / 2'**
  String get lorenzWomen;

  /// No description provided for @dataSafetyTitle.
  ///
  /// In en, this message translates to:
  /// **'Data safety'**
  String get dataSafetyTitle;

  /// No description provided for @dataSafetyNoData.
  ///
  /// In en, this message translates to:
  /// **'The app itself does not collect personal data. Ads are served by Google AdMob, which may collect device identifiers and diagnostics. See the privacy policy for details.'**
  String get dataSafetyNoData;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyLinkLabel.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy link'**
  String get privacyPolicyLinkLabel;

  /// No description provided for @privacyPolicyCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy link'**
  String get privacyPolicyCopy;

  /// No description provided for @privacyPolicyCopied.
  ///
  /// In en, this message translates to:
  /// **'Link copied'**
  String get privacyPolicyCopied;

  /// No description provided for @iconCredit.
  ///
  /// In en, this message translates to:
  /// **'Icon assets designed with resources from Flaticon.com.'**
  String get iconCredit;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'fr', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
