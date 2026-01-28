import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tdeecalculator/l10n/app_localizations.dart';
import 'package:tdeecalculator/theme.dart';
import 'package:tdeecalculator/ui/app_background.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  static const String _privacyPolicyUrl =
      'https://sites.google.com/view/tdeecalc/privacy-policy?authuser=0';

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
                      Text(
                        l10n.aboutTitle,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
                    decoration: BoxDecoration(
                      color: kSurface,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F1A1B).withOpacity(0.12),
                          blurRadius: 18,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.formulasUsed,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          l10n.tdeeUsesHB,
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          l10n.menMetric,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          l10n.menMetricFormula,
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          l10n.womenMetric,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          l10n.womenMetricFormula,
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          l10n.bodyFatNote,
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          l10n.katchFormula,
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          l10n.idealWeightNote,
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          l10n.lorenzMen,
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          l10n.lorenzWomen,
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 16),
                        Divider(color: const Color(0xFFE1D9CF).withOpacity(0.8)),
                        const SizedBox(height: 12),
                        Text(
                          l10n.dataSafetyTitle,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.dataSafetyNoData,
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.privacyPolicyTitle,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.privacyPolicyLinkLabel,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF5E6768),
                          ),
                        ),
                        const SizedBox(height: 6),
                        SelectableText(
                          _privacyPolicyUrl,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF0F6C6D),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton.icon(
                            onPressed: () async {
                              await Clipboard.setData(
                                const ClipboardData(text: _privacyPolicyUrl),
                              );
                              if (!context.mounted) {
                                return;
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(l10n.privacyPolicyCopied),
                                ),
                              );
                            },
                            icon: const Icon(Icons.copy),
                            label: Text(l10n.privacyPolicyCopy),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          l10n.iconCredit,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF5E6768),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
