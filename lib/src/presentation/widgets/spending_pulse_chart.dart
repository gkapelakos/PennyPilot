import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pennypilot/src/data/models/transaction_model.dart';
import 'package:pennypilot/src/presentation/providers/data_providers.dart';

class SpendingPulseChart extends ConsumerWidget {
  const SpendingPulseChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(recentTransactionsProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 120,
          child: transactionsAsync.when(
            data: (transactions) {
              final daily = <int, double>{};
              final now = DateTime.now();
              for (int i = 0; i < 7; i++) {
                final d = now.subtract(Duration(days: i));
                daily[d.day] = 0;
              }
              for (final t in transactions) {
                if (daily.containsKey(t.date.day)) {
                  daily[t.date.day] = (daily[t.date.day] ?? 0) + t.amount;
                }
              }
              final data = daily.entries.toList().reversed.toList();

              return BarChart(
                BarChartData(
                  maxY: data.isEmpty ? 100 : (data.map((e) => e.value).reduce((a, b) => a > b ? a : b) * 1.2).clamp(100, double.infinity),
                  barGroups: data
                      .asMap()
                      .entries
                      .map((e) => BarChartGroupData(
                            x: e.key,
                            barRods: [
                              BarChartRodData(
                                toY: e.value.value,
                                color: Theme.of(context).colorScheme.primary,
                                width: 12,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ],
                          ))
                      .toList(),
                  titlesData: const FlTitlesData(show: false),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) => const Center(child: Text('Chart error')),
          ),
        ),
      ),
    );
  }
}
