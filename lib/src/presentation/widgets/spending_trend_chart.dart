import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class SpendingTrendChart extends StatelessWidget {
  final List<SpendingData> data;

  const SpendingTrendChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat.Md(),
        intervalType: DateTimeIntervalType.days,
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        labelFormat: '{value}',
        numberFormat: NumberFormat.compactSimpleCurrency(name: 'USD'),
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<SpendingData, DateTime>>[
        SplineAreaSeries<SpendingData, DateTime>(
          dataSource: data,
          xValueMapper: (SpendingData sales, _) => sales.date,
          yValueMapper: (SpendingData sales, _) => sales.amount,
          name: 'Spending',
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderColor: Theme.of(context).colorScheme.primary,
          borderWidth: 2,
        )
      ],
    );
  }
}

class SpendingData {
  SpendingData(this.date, this.amount);
  final DateTime date;
  final double amount;
}
