import 'package:flutter/material.dart';
import 'package:tdeecalculator/theme.dart';
import 'package:tdeecalculator/ui/app_background.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                        'About',
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
                          'Formulas used',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '- TDEE uses the original Harris-Benedict equation.',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Men (metric)',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'BMR = 66.5 + (13.76 x weight kg) + (5.003 x height cm) - (6.755 x age)',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Women (metric)',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'BMR = 655 + (9.563 x weight kg) + (1.850 x height cm) - (4.676 x age)',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          '- When body fat is provided, TDEE uses Katch-McArdle:',
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          'BMR = 370 + (21.6 x LBM)',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          '- Ideal weight uses the Lorenz formula:',
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          'Men: height cm - 100 - (height cm - 150) / 4',
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          'Women: height cm - 100 - (height cm - 150) / 2',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Icon assets designed with resources from Flaticon.com.',
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
