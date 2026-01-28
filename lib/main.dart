import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tdeecalculator/ads/banner_ad_widget.dart';
import 'package:tdeecalculator/l10n/app_localizations.dart';
import 'package:tdeecalculator/functions.dart';
import 'package:tdeecalculator/output.dart';
import 'package:tdeecalculator/theme.dart';
import 'package:tdeecalculator/ui/app_background.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(
        tagForChildDirectedTreatment: TagForChildDirectedTreatment.yes,
        tagForUnderAgeOfConsent: TagForUnderAgeOfConsent.yes,
        maxAdContentRating: MaxAdContentRating.g,
      ),
    );
    await MobileAds.instance.initialize();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: buildAppTheme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController bodyfatController = TextEditingController();

  bool female = false;
  bool imperial = false;

  String selectedActivity = 'Sedentary';
  String selectedGoal = 'Maintain';
  String selectedHeight = '5ft 7in';

  final List<String> activities = const [
    'Sedentary',
    'Light',
    'Moderate',
    'High',
    'Elite',
  ];

  final List<String> goals = const [
    'Maintain',
    'Lose',
    'Gain',
  ];

  final List<String> imperialHeights = const [
    '4ft 7in',
    '4ft 8in',
    '4ft 9in',
    '4ft 10in',
    '4ft 11in',
    '5ft 0in',
    '5ft 1in',
    '5ft 2in',
    '5ft 3in',
    '5ft 4in',
    '5ft 5in',
    '5ft 6in',
    '5ft 7in',
    '5ft 8in',
    '5ft 9in',
    '5ft 10in',
    '5ft 11in',
    '6ft 0in',
    '6ft 1in',
    '6ft 2in',
    '6ft 3in',
    '6ft 4in',
    '6ft 5in',
    '6ft 6in',
    '6ft 7in',
    '6ft 8in',
    '6ft 9in',
    '6ft 10in',
    '6ft 11in',
    '7ft 0in',
  ];

  @override
  void dispose() {
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    bodyfatController.dispose();
    super.dispose();
  }

  String activityLabel(String value, AppLocalizations l10n) {
    switch (value) {
      case 'Sedentary':
        return l10n.activitySedentary;
      case 'Light':
        return l10n.activityLight;
      case 'Moderate':
        return l10n.activityModerate;
      case 'High':
        return l10n.activityHigh;
      case 'Elite':
        return l10n.activityElite;
    }
    return value;
  }

  String goalLabel(String value, AppLocalizations l10n) {
    switch (value) {
      case 'Maintain':
        return l10n.goalMaintain;
      case 'Lose':
        return l10n.goalLose;
      case 'Gain':
        return l10n.goalGain;
    }
    return value;
  }

  String? validateNumber(
    String? value, {
    required double min,
    required double max,
    required AppLocalizations l10n,
    bool optional = false,
  }) {
    if (value == null || value.trim().isEmpty) {
      return optional ? null : l10n.validationRequired;
    }

    final number = double.tryParse(value);
    if (number == null) {
      return l10n.validationInvalidNumber;
    }

    if (number < min || number > max) {
      return l10n.validationOutOfRange;
    }

    return null;
  }

  void submit() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final age = double.parse(ageController.text);
    final weightInput = double.parse(weightController.text);
    final heightCm = imperial
        ? imperialConversion(selectedHeight)
        : double.parse(heightController.text);
    final weightKg = imperial ? weightInput * 0.453592 : weightInput;
    final bodyfat = bodyfatController.text.trim().isEmpty
        ? 0.0
        : double.parse(bodyfatController.text);

    final genderIndex = female ? 655.0955 : 66.4730;
    final weightIndex = female ? 9.5634 : 13.7516;
    final heightIndex = female ? 1.8496 : 5.0033;
    final ageIndex = female ? 4.6756 : 6.7550;

    final idealWeight = female
        ? heightCm - 100 - (heightCm - 150) / 2
        : heightCm - 100 - (heightCm - 150) / 4;

    formValidate(
      context,
      bodyfat,
      weightKg,
      weightIndex,
      idealWeight,
      heightCm,
      heightIndex,
      age,
      ageIndex,
      genderIndex,
      selectedActivity,
      selectedGoal,
      0,
      0,
      0,
      0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          const AppBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.appTitle,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l10n.appSubtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _unitsCard(theme, l10n),
                  const SizedBox(height: 18),
                  _formCard(theme, l10n),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _unitsCard(ThemeData theme, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            l10n.unitsLabel,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SegmentedButton<bool>(
            segments: [
              ButtonSegment(value: false, label: Text(l10n.metric)),
              ButtonSegment(value: true, label: Text(l10n.imperial)),
            ],
            selected: {imperial},
            onSelectionChanged: (selection) {
              setState(() {
                imperial = selection.first;
              });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.selected)
                    ? Colors.white
                    : Colors.transparent,
              ),
              foregroundColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.selected)
                    ? const Color(0xFF0F6C6D)
                    : Colors.white,
              ),
              side: MaterialStateProperty.all(
                BorderSide(color: Colors.white.withOpacity(0.6)),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              ),
              textStyle: MaterialStateProperty.all(
                const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _formCard(ThemeData theme, AppLocalizations l10n) {
    return Container(
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F1A1B).withOpacity(0.12),
            blurRadius: 24,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
      child: Form(
        key: formKey,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final twoColumn = constraints.maxWidth >= 420;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.basics,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                _genderSelector(theme, l10n),
                const SizedBox(height: 12),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) => validateNumber(
                    value,
                    min: 5,
                    max: 100,
                    l10n: l10n,
                  ),
                  decoration: InputDecoration(
                    labelText: l10n.age,
                    suffixText: l10n.years,
                  ),
                ),
                const SizedBox(height: 12),
                twoColumn
                    ? Row(
                        children: [
                          Expanded(child: _weightField(l10n)),
                          const SizedBox(width: 12),
                          Expanded(child: _heightField(l10n)),
                        ],
                      )
                    : Column(
                        children: [
                          _weightField(l10n),
                          const SizedBox(height: 12),
                          _heightField(l10n),
                        ],
                      ),
                const SizedBox(height: 16),
                Text(
                  l10n.activitySection,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedActivity,
                  items: activities
                      .map(
                        (activity) => DropdownMenuItem<String>(
                          value: activity,
                          child: Text(activityLabel(activity, l10n)),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      selectedActivity = value;
                    });
                  },
                  decoration: InputDecoration(labelText: l10n.activityLevel),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: bodyfatController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) => validateNumber(
                    value,
                    min: 3,
                    max: 50,
                    optional: true,
                    l10n: l10n,
                  ),
                  decoration: InputDecoration(
                    labelText: l10n.bodyFatOptional,
                    suffixText: '%',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.goalSection,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedGoal,
                  items: goals
                      .map(
                        (goal) => DropdownMenuItem<String>(
                          value: goal,
                          child: Text(goalLabel(goal, l10n)),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      selectedGoal = value;
                    });
                  },
                  decoration: InputDecoration(labelText: l10n.goal),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: submit,
                    child: Text(l10n.calculate),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _genderSelector(ThemeData theme, AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          l10n.gender,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SegmentedButton<bool>(
          segments: [
            ButtonSegment(value: false, label: Text(l10n.male)),
            ButtonSegment(value: true, label: Text(l10n.female)),
          ],
          selected: {female},
          onSelectionChanged: (selection) {
            setState(() {
              female = selection.first;
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.selected)
                  ? const Color(0xFF0F6C6D)
                  : const Color(0xFFF2EEE8),
            ),
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.selected)
                  ? Colors.white
                  : const Color(0xFF1C1F20),
            ),
            side: MaterialStateProperty.all(
              const BorderSide(color: Color(0xFFE1D9CF)),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            textStyle: MaterialStateProperty.all(
              const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _weightField(AppLocalizations l10n) {
    return TextFormField(
      controller: weightController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) => validateNumber(
        value,
        min: imperial ? 77 : 35,
        max: imperial ? 661 : 300,
        l10n: l10n,
      ),
      decoration: InputDecoration(
        labelText: l10n.weight,
        suffixText: imperial ? 'lb' : 'kg',
      ),
    );
  }

  Widget _heightField(AppLocalizations l10n) {
    if (imperial) {
      return DropdownButtonFormField<String>(
        value: selectedHeight,
        items: imperialHeights
            .map(
              (height) => DropdownMenuItem<String>(
                value: height,
                child: Text(height),
              ),
            )
            .toList(),
        onChanged: (value) {
          if (value == null) {
            return;
          }
          setState(() {
            selectedHeight = value;
          });
        },
        decoration: InputDecoration(labelText: l10n.height),
      );
    }

    return TextFormField(
      controller: heightController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) => validateNumber(
        value,
        min: 100,
        max: 220,
        l10n: l10n,
      ),
      decoration: InputDecoration(
        labelText: l10n.height,
        suffixText: 'cm',
      ),
    );
  }
}



