import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tdeecalculator/functions.dart';
import 'package:tdeecalculator/output.dart';
import 'package:tdeecalculator/theme.dart';
import 'package:tdeecalculator/ui/app_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TDEE Calculator',
      theme: buildAppTheme(),
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

  final Map<String, String> activityLabels = const {
    'Sedentary': 'Sedentary',
    'Light': 'Light activity',
    'Moderate': 'Moderate activity',
    'High': 'High activity',
    'Elite': 'Elite athlete',
  };

  final List<String> goals = const [
    'Maintain',
    'Lose',
    'Gain',
  ];

  final Map<String, String> goalLabels = const {
    'Maintain': 'Maintain weight',
    'Lose': 'Lose weight',
    'Gain': 'Gain weight',
  };

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

  String? validateNumber(
    String? value, {
    required double min,
    required double max,
    bool optional = false,
  }) {
    if (value == null || value.trim().isEmpty) {
      return optional ? null : 'Required';
    }

    final number = double.tryParse(value);
    if (number == null) {
      return 'Invalid number';
    }

    if (number < min || number > max) {
      return 'Out of range';
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
                    'TDEE Calculator',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Find your maintenance calories and daily target.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _unitsCard(theme),
                  const SizedBox(height: 18),
                  _formCard(theme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _unitsCard(ThemeData theme) {
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
            'Units',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SegmentedButton<bool>(
            segments: const [
              ButtonSegment(value: false, label: Text('Metric')),
              ButtonSegment(value: true, label: Text('Imperial')),
            ],
            selected: {imperial},
            onSelectionChanged: (selection) {
              setState(() {
                imperial = selection.first;
              });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? Colors.white
                    : Colors.transparent,
              ),
              foregroundColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(WidgetState.selected)
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

  Widget _formCard(ThemeData theme) {
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
                  'Basics',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                _genderSelector(theme),
                const SizedBox(height: 12),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) => validateNumber(
                    value,
                    min: 5,
                    max: 100,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    suffixText: 'years',
                  ),
                ),
                const SizedBox(height: 12),
                twoColumn
                    ? Row(
                        children: [
                          Expanded(child: _weightField()),
                          const SizedBox(width: 12),
                          Expanded(child: _heightField()),
                        ],
                      )
                    : Column(
                        children: [
                          _weightField(),
                          const SizedBox(height: 12),
                          _heightField(),
                        ],
                      ),
                const SizedBox(height: 16),
                Text(
                  'Activity',
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
                          child: Text(activityLabels[activity] ?? activity),
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
                  decoration: const InputDecoration(labelText: 'Activity level'),
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
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Body fat (optional)',
                    suffixText: '%',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Goal',
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
                          child: Text(goalLabels[goal] ?? goal),
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
                  decoration: const InputDecoration(labelText: 'Goal'),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: submit,
                    child: const Text('Calculate'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _genderSelector(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Gender',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SegmentedButton<bool>(
          segments: const [
            ButtonSegment(value: false, label: Text('Male')),
            ButtonSegment(value: true, label: Text('Female')),
          ],
          selected: {female},
          onSelectionChanged: (selection) {
            setState(() {
              female = selection.first;
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected)
                  ? const Color(0xFF0F6C6D)
                  : const Color(0xFFF2EEE8),
            ),
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected)
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

  Widget _weightField() {
    return TextFormField(
      controller: weightController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) => validateNumber(
        value,
        min: imperial ? 77 : 35,
        max: imperial ? 661 : 300,
      ),
      decoration: InputDecoration(
        labelText: 'Weight',
        suffixText: imperial ? 'lb' : 'kg',
      ),
    );
  }

  Widget _heightField() {
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
        decoration: const InputDecoration(labelText: 'Height'),
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
      ),
      decoration: const InputDecoration(
        labelText: 'Height',
        suffixText: 'cm',
      ),
    );
  }
}
