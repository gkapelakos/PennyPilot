import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              final daily = <DateTime, double>{};
              final now = DateTime.now();
              // Initialize last 7 days
              for (int i = 0; i < 7; i++) {
                final d = DateTime(now.year, now.month, now.day)
                    .subtract(Duration(days: i));
                daily[d] = 0;
              }
              // Aggregate transactions by date (ignoring time)
              for (final t in transactions) {
                final dateKey = DateTime(t.date.year, t.date.month, t.date.day);
                if (daily.containsKey(dateKey)) {
                  daily[dateKey] = (daily[dateKey] ?? 0) + t.amount;
                }
              }
              // Sort by date (oldest first) for chart display
              final sortedDates = daily.keys.toList()..sort();
              final amounts = sortedDates.map((date) => daily[date]!).toList();
              final maxAmount = amounts.isEmpty
                  ? 100.0
                  : amounts.reduce((a, b) => a > b ? a : b);

              return BarChart(
                BarChartData(
                  maxY: (maxAmount * 1.2).clamp(100, double.infinity),
                  barGroups: sortedDates
                      .asMap()
                      .entries
                      .map((e) => BarChartGroupData(
                            x: e.key,
                            barRods: [
                              BarChartRodData(
                                toY: amounts[e.key],
                                color: Theme.of(context).colorScheme.primary,
                                width: 12,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ],
                          ))
                      .toList(),
                  titlesData: FlTitlesData(show: false),
                  gridData: FlGridData(show: false),
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
