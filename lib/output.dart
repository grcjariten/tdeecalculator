import 'package:flutter/material.dart';
import 'package:tdeecalculator/l10n/app_localizations.dart';
import 'package:tdeecalculator/about.dart';
import 'package:tdeecalculator/theme.dart';
import 'package:tdeecalculator/ui/app_background.dart';

class OutputPage extends StatelessWidget {
  const OutputPage({
    Key? key,
    required this.finalTdee,
    required this.tdee,
    required this.bmr,
    required this.bmi,
    required this.idealWeight,
  }) : super(key: key);

  final double finalTdee;
  final double tdee;
  final double bmr;
  final double bmi;
  final double idealWeight;

  String _asWhole(double value) => value.round().toString();

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
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          l10n.resultsTitle,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const InfoPage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.info_outline),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _highlightCard(theme, l10n),
                  const SizedBox(height: 18),
                  Text(
                    l10n.breakdown,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final twoColumn = constraints.maxWidth >= 380;
                      final tiles = [
                        _metricTile(
                          theme,
                          label: l10n.targetCalories,
                          value: _asWhole(finalTdee),
                          unit: l10n.perDay,
                        ),
                        _metricTile(
                          theme,
                          label: l10n.maintenance,
                          value: _asWhole(tdee),
                          unit: l10n.perDay,
                        ),
                        _metricTile(
                          theme,
                          label: l10n.bmr,
                          value: _asWhole(bmr),
                          unit: l10n.calories,
                        ),
                        _metricTile(
                          theme,
                          label: l10n.bmi,
                          value: _asWhole(bmi),
                          unit: '',
                        ),
                        _metricTile(
                          theme,
                          label: l10n.idealWeight,
                          value: _asWhole(idealWeight),
                          unit: l10n.kgUnit,
                        ),
                      ];

                      if (!twoColumn) {
                        return Column(
                          children: tiles
                              .map(
                                (tile) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: tile,
                                ),
                              )
                              .toList(),
                        );
                      }

                      return Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: tiles
                            .map(
                              (tile) => SizedBox(
                                width: (constraints.maxWidth - 12) / 2,
                                child: tile,
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _highlightCard(ThemeData theme, AppLocalizations l10n) {
    final weekly = finalTdee * 7;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F6C6D), Color(0xFF0B3C40)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F1A1B).withOpacity(0.25),
            blurRadius: 24,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.dailyTarget,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            _asWhole(finalTdee),
            style: theme.textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.caloriesPerDay,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 18),
          Divider(color: Colors.white.withOpacity(0.2), height: 1),
          const SizedBox(height: 14),
          Text(
            l10n.weeklyTarget,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            _asWhole(weekly),
            style: theme.textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            l10n.caloriesPerWeek,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _metricTile(
    ThemeData theme, {
    required String label,
    required String value,
    required String unit,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE1D9CF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF5E6768),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                value,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (unit.isNotEmpty) ...[
                const SizedBox(width: 6),
                Text(
                  unit,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF5E6768),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
