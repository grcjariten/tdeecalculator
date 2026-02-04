import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tdeecalculator/about.dart';
import 'package:tdeecalculator/functions.dart';
import 'package:tdeecalculator/l10n/app_localizations.dart';
import 'package:tdeecalculator/theme.dart';
import 'package:tdeecalculator/ui/app_background.dart';

class OutputPage extends StatelessWidget {
  const OutputPage({
    Key? key,
    required this.results,
  }) : super(key: key);

  final CalculationResults results;

  String _asWhole(double value) => value.round().toString();

  String _formulaLabel(BmrFormula formula, AppLocalizations l10n) {
    switch (formula) {
      case BmrFormula.harrisBenedict:
        return l10n.formulaHarris;
      case BmrFormula.mifflinStJeor:
        return l10n.formulaMifflin;
      case BmrFormula.katchMcArdle:
        return l10n.formulaKatch;
    }
  }

  String _buildShareText(AppLocalizations l10n) {
    final buffer = StringBuffer()
      ..writeln(l10n.appTitle)
      ..writeln(
        '${l10n.dailyTarget}: ${_asWhole(results.targetTdee)} ${l10n.caloriesPerDay}',
      )
      ..writeln(
        '${l10n.maintenance}: ${_asWhole(results.tdee)} ${l10n.perDay}',
      )
      ..writeln('${l10n.bmr}: ${_asWhole(results.bmr)} ${l10n.calories}')
      ..writeln('${l10n.bmi}: ${results.bmi.toStringAsFixed(1)}')
      ..writeln('${l10n.bmiPrime}: ${results.bmiPrime.toStringAsFixed(2)}')
      ..writeln('${l10n.newBmi}: ${results.newBmi.toStringAsFixed(1)}')
      ..writeln(
        '${l10n.idealWeight}: ${_asWhole(results.idealWeight)} ${l10n.kgUnit}',
      )
      ..writeln(
        '${l10n.formulaUsed}: ${_formulaLabel(results.primaryFormula, l10n)}',
      );

    return buffer.toString().trim();
  }

  Future<void> _copyResults(BuildContext context, AppLocalizations l10n) async {
    await Clipboard.setData(ClipboardData(text: _buildShareText(l10n)));
    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.resultsCopied)),
    );
  }

  Future<void> _shareResults(BuildContext context, AppLocalizations l10n) async {
    final box = context.findRenderObject() as RenderBox?;
    final origin = box == null
        ? Rect.zero
        : box.localToGlobal(Offset.zero) & box.size;
    await SharePlus.instance.share(
      ShareParams(
        text: _buildShareText(l10n),
        sharePositionOrigin: origin,
      ),
    );
  }

  void _showComparisonSheet(
    BuildContext context,
    ThemeData theme,
    AppLocalizations l10n,
  ) {
    final otherFormulas = results.comparisons
        .where((estimate) => estimate.formula != results.primaryFormula)
        .toList();
    if (otherFormulas.isEmpty) {
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: kSurface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SafeArea(
            top: false,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.compareFormulas,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...otherFormulas
                      .map(
                        (estimate) =>
                            _comparisonTile(theme, l10n, estimate),
                      )
                      .toList(),
                  const SizedBox(height: 16),
                  Text(
                    l10n.bmiAlternatives,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      _metricChip(
                        theme,
                        label: l10n.bmiPrime,
                        value: results.bmiPrime.toStringAsFixed(2),
                      ),
                      _metricChip(
                        theme,
                        label: l10n.newBmi,
                        value: results.newBmi.toStringAsFixed(1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _comparisonTile(
    ThemeData theme,
    AppLocalizations l10n,
    FormulaEstimate estimate,
  ) {
    final available = estimate.bmr != null;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE1D9CF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _formulaLabel(estimate.formula, l10n),
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          if (!available)
            Text(
              l10n.requiresBodyFat,
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFFCE4A4A),
                fontWeight: FontWeight.w600,
              ),
            )
          else
            Text(
              '${l10n.bmr}: ${_asWhole(estimate.bmr!)} ${l10n.calories} | '
              '${l10n.maintenance}: ${_asWhole(estimate.tdee!)} ${l10n.perDay} | '
              '${l10n.targetCalories}: ${_asWhole(estimate.targetTdee!)} ${l10n.perDay}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF5E6768),
                height: 1.4,
              ),
            ),
        ],
      ),
    );
  }

  Widget _metricChip(
    ThemeData theme, {
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE1D9CF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF5E6768),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final canCompare = results.comparisons.length > 1;

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
                  const SizedBox(height: 12),
                  _formulaCard(theme, l10n),
                  const SizedBox(height: 8),
                  _actionsRow(context, l10n, canCompare),
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
                          value: _asWhole(results.targetTdee),
                          unit: l10n.perDay,
                        ),
                        _metricTile(
                          theme,
                          label: l10n.maintenance,
                          value: _asWhole(results.tdee),
                          unit: l10n.perDay,
                        ),
                        _metricTile(
                          theme,
                          label: l10n.bmr,
                          value: _asWhole(results.bmr),
                          unit: l10n.calories,
                        ),
                        _metricTile(
                          theme,
                          label: l10n.bmi,
                          value: results.bmi.toStringAsFixed(1),
                          unit: '',
                        ),
                        _metricTile(
                          theme,
                          label: l10n.idealWeight,
                          value: _asWhole(results.idealWeight),
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
    final weekly = results.targetTdee * 7;
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
            _asWhole(results.targetTdee),
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

  Widget _formulaCard(ThemeData theme, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE1D9CF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.formulaUsed,
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF5E6768),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _formulaLabel(results.primaryFormula, l10n),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionsRow(
    BuildContext context,
    AppLocalizations l10n,
    bool canCompare,
  ) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE1D9CF)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => _copyResults(context, l10n),
            icon: const Icon(Icons.copy),
            tooltip: l10n.copyResults,
          ),
          IconButton(
            onPressed: () => _shareResults(context, l10n),
            icon: const Icon(Icons.share),
            tooltip: l10n.shareResults,
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: canCompare
                ? () => _showComparisonSheet(context, theme, l10n)
                : null,
            icon: const Icon(Icons.tune),
            label: Text(l10n.compareFormulas),
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
