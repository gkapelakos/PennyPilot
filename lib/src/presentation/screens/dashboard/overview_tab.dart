import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pennypilot/src/presentation/providers/data_providers.dart';
import 'package:pennypilot/src/presentation/providers/email_provider.dart';
import 'package:pennypilot/src/data/models/transaction_model.dart';
import 'package:intl/intl.dart';

class OverviewTab extends ConsumerWidget {
  final bool isDemoMode;

  const OverviewTab({super.key, required this.isDemoMode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(recentTransactionsProvider); // recent = last 30 days
    final subscriptionsAsync = ref.watch(activeSubscriptionsProvider);
    final currencyFormat = NumberFormat.simpleCurrency();

    return Scaffold(
      appBar: AppBar(
        title: const Text('PennyPilot'),
        actions: [
          if (isDemoMode)
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Chip(
                label: Text('DEMO'),
                visualDensity: VisualDensity.compact,
              ),
            ),
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Scan Emails',
            onPressed: () async {
              try {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Scanning emails...')),
                );
                await ref.read(emailServiceProvider).scanEmails();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Scan complete')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error scanning: $e'), backgroundColor: Colors.red),
                  );
                }
              }
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last 30 Days',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // Total Spend Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      'Total Spent',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    transactionsAsync.when(
                      data: (transactions) {
                        final total = transactions.fold<double>(0, (sum, t) => sum + t.amount);
                        return Text(
                          currencyFormat.format(total),
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (e, s) => Text('Error: $e'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Recent Transactions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            transactionsAsync.when(
              data: (transactions) {
                if (transactions.isEmpty) {
                  return const Text('No recent transactions found.');
                }
                // Show top 5
                final displayTransactions = transactions.take(5).toList();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: displayTransactions.length,
                  itemBuilder: (context, index) {
                    final t = displayTransactions[index];
                    return ListTile(
                      leading: CircleAvatar(child: Text(t.merchantName[0].toUpperCase())),
                      title: Text(t.merchantName),
                      subtitle: Text(DateFormat.yMMMd().format(t.date)),
                      trailing: Text(currencyFormat.format(t.amount)),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Text('Error loading transactions: $e'),
            ),
            const SizedBox(height: 24),
            Text(
              'Upcoming Subscriptions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            subscriptionsAsync.when(
              data: (subscriptions) {
                if (subscriptions.isEmpty) {
                   return const Text('No active subscriptions.');
                }
                // Sort by next renewal roughly (already sorted by provider? yes sortByNextRenewalDate)
                final topSubs = subscriptions.take(3).toList();
                
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: topSubs.length,
                  itemBuilder: (context, index) {
                    final s = topSubs[index];
                    final daysUntil = s.nextRenewalDate.difference(DateTime.now()).inDays + 1; // approx
                    return ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.event_repeat)),
                      title: Text(s.serviceName),
                      subtitle: Text('Renewing in ${daysUntil > 0 ? daysUntil : 0} days'),
                      trailing: Text(currencyFormat.format(s.amount)),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Text('Error loading subscriptions: $e'),
            ),
          ],
        ),
      ),
    );
  }
}

