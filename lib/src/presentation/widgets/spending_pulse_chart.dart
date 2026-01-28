import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:pennypilot/src/presentation/providers/transactions_provider.dart';
import 'package:intl/intl.dart';

class SpendingPulseChart extends ConsumerWidget {
  const SpendingPulseChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(recentTransactionsProvider);

    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant.withAlpha(51)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 150,
          child: transactionsAsync.when(
            data: (transactions) {
              final daily = <DateTime, double>{};
              final now = DateTime.now();
              // Initialize last 7 days
              for (int i = 6; i >= 0; i--) {
                final d = DateTime(now.year, now.month, now.day)
                    .subtract(Duration(days: i));
                daily[d] = 0;
              }
              // Aggregate transactions by date
              for (final t in transactions) {
                final dateKey = DateTime(t.date.year, t.date.month, t.date.day);
                if (daily.containsKey(dateKey)) {
                  daily[dateKey] = (daily[dateKey] ?? 0) + t.amount;
                }
              }

              final chartData = daily.entries
                  .map((e) => _ChartData(e.key, e.value))
                  .toList()
                ..sort((a, b) => a.date.compareTo(b.date));

              return SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryXAxis: DateTimeAxis(
                  dateFormat: DateFormat.E(),
                  intervalType: DateTimeIntervalType.days,
                  majorGridLines: const MajorGridLines(width: 0),
                  axisLine: const AxisLine(width: 0),
                  labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                primaryYAxis: NumericAxis(
                  isVisible: false,
                ),
                series: <CartesianSeries<_ChartData, DateTime>>[
                  ColumnSeries<_ChartData, DateTime>(
                    dataSource: chartData,
                    xValueMapper: (_ChartData data, _) => data.date,
                    yValueMapper: (_ChartData data, _) => data.amount,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(6)),
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.8),
                    animationDuration: 1000,
                  )
                ],
                tooltipBehavior: TooltipBehavior(enable: true, header: ''),
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

class _ChartData {
  _ChartData(this.date, this.amount);
  final DateTime date;
  final double amount;
}
