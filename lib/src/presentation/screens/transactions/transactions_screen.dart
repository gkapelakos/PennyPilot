import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pennypilot/src/presentation/providers/transactions_provider.dart';
import 'package:pennypilot/src/presentation/widgets/transaction_card.dart';
import 'package:pennypilot/src/presentation/widgets/empty_state.dart';
import 'package:pennypilot/src/data/database/app_database.dart';
import 'package:intl/intl.dart';
import 'package:pennypilot/src/presentation/providers/app_state_provider.dart';
import 'package:pennypilot/src/localization/generated/app_localizations.dart';

class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  String _sortBy = 'date'; // 'date', 'amount', 'merchant'
  String _searchQuery = '';
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transactionsAsync = ref.watch(transactionsProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: _isSearching
                ? TextField(
                    controller: _searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: l10n.searchHint,
                      border: InputBorder.none,
                      filled: false,
                    ),
                    onChanged: (value) => setState(() => _searchQuery = value),
                  )
                : Text(l10n.transactions),
            actions: [
              IconButton(
                icon: Icon(_isSearching ? Icons.close : Icons.search),
                tooltip: _isSearching
                    ? MaterialLocalizations.of(context).closeButtonTooltip
                    : l10n.searchHint,
                onPressed: () {
                  setState(() {
                    if (_isSearching) {
                      _isSearching = false;
                      _searchQuery = '';
                      _searchController.clear();
                    } else {
                      _isSearching = true;
                    }
                  });
                },
              ),
              if (!_isSearching)
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  tooltip: l10n.filterAndSort,
                  onPressed: () => _showFilterSheet(context),
                ),
            ],
          ),
          transactionsAsync.when(
            data: (transactions) {
              if (transactions.isEmpty) {
                return SliverFillRemaining(
                  child: EmptyState(
                    icon: Icons.receipt_long,
                    title: l10n.noTransactionsYet,
                    message: l10n.connectEmailDescription,
                    action: FilledButton.icon(
                      onPressed: () => context.push('/connect-email'),
                      icon: const Icon(Icons.email),
                      label: Text(l10n.connectEmail),
                    ),
                  ),
                );
              }

              var filteredTransactions = transactions;
              // if (_filterCategory != 'All') {
              //   filteredTransactions = transactions
              //       .where((t) => t.category == _filterCategory)
              //       .toList();
              // }
              if (_searchQuery.isNotEmpty) {
                final query = _searchQuery.toLowerCase();
                filteredTransactions = filteredTransactions
                    .where((t) =>
                        t.merchantName.toLowerCase().contains(query) ||
                        (t.notes?.toLowerCase().contains(query) ?? false))
                    .toList();
              }

              filteredTransactions = List.from(filteredTransactions);
              switch (_sortBy) {
                case 'amount':
                  filteredTransactions
                      .sort((a, b) => b.amount.compareTo(a.amount));
                  break;
                case 'merchant':
                  filteredTransactions
                      .sort((a, b) => a.merchantName.compareTo(b.merchantName));
                  break;
                case 'date':
                default:
                  filteredTransactions.sort((a, b) => b.date.compareTo(a.date));
              }

              return SliverMainAxisGroup(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child:
                          _buildRefinedSummary(context, filteredTransactions),
                    ),
                  ),
                  ..._buildGroupedList(context, filteredTransactions, l10n),
                  const SliverToBoxAdapter(child: SizedBox(height: 100)),
                ],
              );
            },
            loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator())),
            error: (error, stack) => SliverFillRemaining(
              child: Center(child: Text(error.toString())),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildGroupedList(BuildContext context,
      List<Transaction> transactions, AppLocalizations l10n) {
    if (transactions.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: EmptyState(
            icon: Icons.filter_alt_off,
            title: l10n.noMatches,
            message: l10n.tryAdjustingFilters,
            action: TextButton(
              onPressed: () => setState(() {
                _sortBy = 'date';
              }),
              child: Text(l10n.clearFilters),
            ),
          ),
        )
      ];
    }

    if (_sortBy != 'date') {
      return [
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildTransactionItem(transactions[index]),
              childCount: transactions.length,
            ),
          ),
        )
      ];
    }

    final groups = <DateTime, List<Transaction>>{};
    for (final t in transactions) {
      final date = DateTime(t.date.year, t.date.month, t.date.day);
      groups.putIfAbsent(date, () => []).add(t);
    }

    final sortedDates = groups.keys.toList()..sort((a, b) => b.compareTo(a));

    return sortedDates.map((date) {
      return SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Text(
                _formatHeaderDate(date, l10n),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildTransactionItem(groups[date]![index]),
              childCount: groups[date]!.length,
            ),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildTransactionItem(Transaction transaction) {
    return TransactionCard(
      transaction: transaction,
      showConfidence: true,
      expandable: true,
      onTap: () {
        // context.push('/transactions/${transaction.id}');
      },
    );
  }

  String _formatHeaderDate(DateTime date, AppLocalizations l10n) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    if (date == today) return l10n.today.toUpperCase();
    if (date == yesterday) return l10n.yesterday.toUpperCase();

    if (date.year == now.year) {
      return DateFormat('MMMM d').format(date).toUpperCase();
    }
    return DateFormat('MMMM d, y').format(date).toUpperCase();
  }

  Widget _buildRefinedSummary(
      BuildContext context, List<Transaction> transactions) {
    final flows = _calculateMonthlyFlows(transactions);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(28),
        border:
            Border.all(color: theme.colorScheme.outlineVariant.withAlpha(51)),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: _summaryColumn(
                context,
                l10n.income,
                flows['income']!,
                theme.colorScheme.primary,
              ),
            ),
            VerticalDivider(
                color: theme.colorScheme.outlineVariant.withAlpha(51),
                thickness: 1,
                indent: 4,
                endIndent: 4),
            Expanded(
              child: _summaryColumn(
                context,
                l10n.expenses,
                flows['expense']!,
                theme.colorScheme.onSurface,
              ),
            ),
            VerticalDivider(
                color: theme.colorScheme.outlineVariant.withAlpha(51),
                thickness: 1,
                indent: 4,
                endIndent: 4),
            Expanded(
              child: _summaryColumn(
                context,
                l10n.net,
                flows['net']!,
                flows['net']! >= 0 ? Colors.green : theme.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryColumn(
      BuildContext context, String label, double amount, Color color) {
    final appCurrency = ref.watch(appStateProvider).currencyCode;
    final currencyFormat =
        NumberFormat.compactSimpleCurrency(name: appCurrency);

    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          currencyFormat.format(amount.abs()),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Map<String, double> _calculateMonthlyFlows(List<Transaction> transactions) {
    final now = DateTime.now();

    double income = 0;
    double expense = 0;

    for (var t in transactions) {
      if (t.date.year == now.year && t.date.month == now.month) {
        if (t.kind == 0) {
          // 0: income, 1: expense
          income += t.amount;
        } else {
          expense += t.amount;
        }
      }
    }

    return {
      'income': income,
      'expense': expense,
      'net': income - expense,
    };
  }

  void _showFilterSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.filterAndSort,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            Text(
              'Sort By',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: Text(l10n.date),
                  selected: _sortBy == 'date',
                  onSelected: (selected) {
                    setState(() {
                      _sortBy = 'date';
                    });
                    Navigator.pop(context);
                  },
                ),
                ChoiceChip(
                  label: Text(l10n.amount),
                  selected: _sortBy == 'amount',
                  onSelected: (selected) {
                    setState(() {
                      _sortBy = 'amount';
                    });
                    Navigator.pop(context);
                  },
                ),
                ChoiceChip(
                  label: Text(l10n.merchant),
                  selected: _sortBy == 'merchant',
                  onSelected: (selected) {
                    setState(() {
                      _sortBy = 'merchant';
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _sortBy = 'date';
                    });
                    Navigator.pop(context);
                  },
                  child: Text(l10n.reset),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(l10n.apply),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
