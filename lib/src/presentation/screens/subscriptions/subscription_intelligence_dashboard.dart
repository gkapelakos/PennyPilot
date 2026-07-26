import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../providers/database_provider.dart';
import '../../../data/database/app_database.dart';
import 'package:pennypilot/src/presentation/widgets/shadcn_card.dart';
import '../../widgets/scanner/premium_ocr_scanner.dart';
import 'package:pennypilot/src/localization/generated/app_localizations.dart';
import 'package:pennypilot/src/presentation/providers/app_state_provider.dart';
import 'package:intl/intl.dart';

class SubscriptionIntelligenceDashboard extends ConsumerWidget {
  const SubscriptionIntelligenceDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDatabaseProvider);
    final l10n = AppLocalizations.of(context)!;
    final appCurrency = ref.watch(appStateProvider).currencyCode;
    final currencySymbol = NumberFormat.simpleCurrency(name: appCurrency).currencySymbol;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.intelligence,
          style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: -1),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PremiumOCRScanner(),
            const SizedBox(height: 24),
            _buildStatGrid(ref, db, currencySymbol),
            const SizedBox(height: 16),
            _buildTrendChart(context),
            const SizedBox(height: 16),
            _buildSubscriptionList(db, currencySymbol),
          ],
        ),
      ),
    );
  }

  Widget _buildStatGrid(WidgetRef ref, AppDatabase db, String currencySymbol) {
    final l10n = AppLocalizations.of(ref.context)!;
    return StreamBuilder<double>(
      stream: db.watchMonthlySubscriptionTotal(),
      builder: (context, snapshot) {
        final total = snapshot.data ?? 0.0;
        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.5,
          children: [
            ShadcnCard(
              title: l10n.monthlyBurn,
              subtitle: l10n.totalSubscriptions,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                "$currencySymbol${total.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
            ),
            ShadcnCard(
              title: l10n.zombieSubs,
              subtitle: l10n.potentialSavings,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              trailing: Icon(Icons.warning_amber_rounded,
                  color: Theme.of(context).colorScheme.error, size: 20),
              child: StreamBuilder<List<Subscription>>(
                stream: db.watchAllSubscriptions(),
                builder: (context, snapshot) {
                  final subs = snapshot.data ?? [];
                  final zombieCount = subs.where((s) =>
                    s.lifecycleState == 0 && // 0 = active
                    s.nextRenewalDate.isBefore(DateTime.now().subtract(const Duration(days: 90)))
                  ).length;
                  return Text(
                    "$zombieCount",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTrendChart(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return ShadcnCard(
      title: l10n.costTrend,
      subtitle: l10n.dailySubscriptionExpense,
      child: SizedBox(
        height: 200,
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 310),
                  const FlSpot(2, 280),
                  const FlSpot(4, 350),
                  const FlSpot(6, 310),
                  const FlSpot(8, 400),
                  const FlSpot(10, 380),
                  const FlSpot(12, 420),
                ],
                isCurved: true,
                color: theme.colorScheme.primary,
                barWidth: 4,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionList(AppDatabase db, String currencySymbol) {
    return StreamBuilder<List<Subscription>>(
      stream: db.watchAllSubscriptions(),
      builder: (context, snapshot) {
        final subs = snapshot.data ?? [];
        final l10n = AppLocalizations.of(context)!;
        final theme = Theme.of(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                l10n.activeSubscriptions,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (subs.isEmpty)
              ShadcnCard(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(l10n.noSubscriptionsDetected),
                  ),
                ),
              )
            else
              ...subs.map((sub) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ShadcnCard(
                      padding: const EdgeInsets.all(12),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: theme.colorScheme.surfaceContainerHighest,
                          child: Text(sub.serviceName.isNotEmpty
                              ? sub.serviceName.substring(0, 1).toUpperCase()
                              : "?"),
                        ),
                        title: Text(
                          sub.serviceName,
                          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          "${l10n.nextRenewal}: ${sub.nextRenewalDate.day}/${sub.nextRenewalDate.month}"),
                        trailing: Text(
                          "$currencySymbol${sub.amount.toStringAsFixed(2)}",
                          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
          ],
        );
      },
    );
  }
}
