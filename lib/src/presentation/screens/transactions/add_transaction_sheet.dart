import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pennypilot/src/data/models/transaction_model.dart';
import 'package:pennypilot/src/presentation/providers/data_providers.dart';
import 'package:pennypilot/src/presentation/providers/database_provider.dart';
import 'package:pennypilot/src/presentation/providers/app_state_provider.dart';
import 'package:pennypilot/src/localization/generated/app_localizations.dart';

import 'package:pennypilot/src/presentation/providers/currency_provider.dart';

class AddTransactionSheet extends ConsumerStatefulWidget {
  const AddTransactionSheet({super.key});

  @override
  ConsumerState<AddTransactionSheet> createState() =>
      _AddTransactionSheetState();
}

class _AddTransactionSheetState extends ConsumerState<AddTransactionSheet> {
  final _formKey = GlobalKey<FormState>();
  TransactionKind _kind = TransactionKind.expense;
  late DateTime _selectedDate;
  final _amountController = TextEditingController();
  final _merchantController = TextEditingController();
  String? _category;
  bool _isRecurring = false;
  bool _isLoading = false;

  final List<String> _expenseCategories = [
    'Food & Dining',
    'Shopping',
    'Transportation',
    'Utilities',
    'Entertainment',
    'Healthcare',
    'Housing',
    'Travel',
    'Other',
  ];

  final List<String> _incomeCategories = [
    'Salary',
    'Freelance',
    'Investments',
    'Refunds',
    'Gifts',
    'Other',
  ];
  String? _selectedCurrency;
  double? _convertedAmount;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    // Initialize with default currency, will be updated in build/didChangeDependencies if needed
  }

// ...

  Future<void> _saveTransaction() async {
    if (!_formKey.currentState!.validate()) return;

    // Check if currency conversion is needed and rates are available
    if (_convertedAmount == null &&
        _selectedCurrency != ref.read(appStateProvider).currencyCode) {
      // Fallback if conversion didn't happen for some reason, though UI should handle it
    }

    setState(() => _isLoading = true);

    try {
      final isar = ref.read(isarProvider);

      final preferredCurrency = ref.read(appStateProvider).currencyCode;

      final enteredAmount = double.parse(
          _amountController.text.replaceAll(RegExp(r'[^0-9.]'), ''));
      final finalAmount =
          (_selectedCurrency != preferredCurrency && _convertedAmount != null)
              ? _convertedAmount!
              : enteredAmount;

      final transaction = TransactionModel()
        ..kind = _kind
        ..origin = TransactionOrigin.manual
        ..merchantName = _merchantController.text.trim()
        ..rawMerchantName = _merchantController.text.trim()
        ..amount = finalAmount
        ..date = _selectedDate
        ..category = _category ?? 'Other'
        ..isRecurring = _isRecurring
        ..hasLineItems = false
        ..userVerified = true
        ..extractionConfidence = ConfidenceLevel.high
        ..currency =
            preferredCurrency // Always save in preferred currency for aggregation consistency
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();

      // Store original currency details if different?
      // TransactionModel currently doesn't have originalCurrency/Amount fields exposed widely,
      // but keeping it simple as requested: "converting it into the default selected currency"

      await isar.writeTxn(() async {
        await isar.transactionModels.put(transaction);
      });

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(AppLocalizations.of(context)!.transactionRecorded)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(AppLocalizations.of(context)!.error(e.toString()))),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _updateConversion(Map<String, dynamic> rates, String defaultCurrency) {
    if (_amountController.text.isEmpty) {
      setState(() => _convertedAmount = 0.0);
      return;
    }

    final amount = double.tryParse(
        _amountController.text.replaceAll(RegExp(r'[^0-9.]'), ''));
    if (amount == null) return;

    if (_selectedCurrency == defaultCurrency) {
      setState(() => _convertedAmount = amount);
      return;
    }

    // Conversion Logic
    // Rates are typically relative to a base (e.g. USD or EUR)
    // If rates provided by provider are: {"USD": 1.0, "EUR": 0.92, ...} with USD base
    // To convert FROM _selectedCurrency TO defaultCurrency:
    // Amount / Rate(_selectedCurrency) * Rate(defaultCurrency)

    final fromRate = rates[_selectedCurrency]?.toDouble();
    final toRate = rates[defaultCurrency]?.toDouble();

    if (fromRate != null && toRate != null) {
      setState(() {
        _convertedAmount = amount / fromRate * toRate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIncome = _kind == TransactionKind.income;
    final categories = isIncome ? _incomeCategories : _expenseCategories;
    final l10n = AppLocalizations.of(context)!;
    final defaultCurrency = ref.watch(appStateProvider).currencyCode;

    // Initialize selected currency if null
    _selectedCurrency ??= defaultCurrency;

    final exchangeRatesAsync = ref.watch(exchangeRatesProvider);

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Handle bar
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 32,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurfaceVariant.withAlpha(102),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          exchangeRatesAsync.when(
            loading: () => const LinearProgressIndicator(),
            error: (err, stack) =>
                const SizedBox.shrink(), // Fail silently or show error
            data: (rates) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n.newEntry,
                        style: theme.textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),

                      // Type Selection
                      SegmentedButton<TransactionKind>(
                        segments: [
                          ButtonSegment(
                            value: TransactionKind.expense,
                            label: Text(l10n.expense),
                            icon: const Icon(Icons.arrow_upward, size: 16),
                          ),
                          ButtonSegment(
                            value: TransactionKind.income,
                            label: Text(l10n.incomeLabel),
                            icon: const Icon(Icons.arrow_downward, size: 16),
                          ),
                        ],
                        selected: {_kind},
                        onSelectionChanged:
                            (Set<TransactionKind> newSelection) {
                          setState(() {
                            _kind = newSelection.first;
                            _category = null;
                          });
                        },
                        style: ButtonStyle(
                          visualDensity: VisualDensity.compact,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Amount Row with Currency Dropdown
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: _amountController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: isIncome
                                    ? Colors.green
                                    : theme.colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Amount',
                                prefixIcon: Icon(Icons.attach_money, size: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onChanged: (_) =>
                                  _updateConversion(rates, defaultCurrency),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return l10n.pleaseEnterAmount;
                                }
                                if (double.tryParse(value.replaceAll(
                                        RegExp(r'[^0-9.]'), '')) ==
                                    null) {
                                  return l10n.invalidAmount;
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 1,
                            child: DropdownButtonFormField<String>(
                              initialValue: _selectedCurrency,
                              isExpanded: true,
                              decoration: InputDecoration(
                                labelText: 'Currency',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 16),
                              ),
                              items: rates.keys
                                  .map((code) => DropdownMenuItem(
                                        value: code,
                                        child: Text(code,
                                            style:
                                                const TextStyle(fontSize: 14)),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  _selectedCurrency = val;
                                });
                                _updateConversion(rates, defaultCurrency);
                              },
                            ),
                          ),
                        ],
                      ),

                      // Conversion Preview
                      if (_selectedCurrency != defaultCurrency &&
                          _convertedAmount != null &&
                          _convertedAmount! > 0)
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 4),
                          child: Text(
                            '≈ ${NumberFormat.simpleCurrency(name: defaultCurrency).format(_convertedAmount)}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.tertiary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      const SizedBox(height: 24),

                      // Merchant/Source Field
                      TextFormField(
                        controller: _merchantController,
                        decoration: InputDecoration(
                          labelText:
                              isIncome ? l10n.source : l10n.merchantLabel,
                          prefixIcon: Icon(isIncome ? Icons.work : Icons.store),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: theme.colorScheme.surfaceContainerHighest
                              .withAlpha(77),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return isIncome
                                ? l10n.pleaseEnterSource
                                : l10n.pleaseEnterMerchant;
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Category Dropdown
                      DropdownButtonFormField<String>(
                        initialValue: _category,
                        decoration: InputDecoration(
                          labelText: l10n.category,
                          prefixIcon: const Icon(Icons.category),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: theme.colorScheme.surfaceContainerHighest
                              .withAlpha(77),
                        ),
                        items: categories
                            .map((c) => DropdownMenuItem(
                                  value: c,
                                  child: Text(c),
                                ))
                            .toList(),
                        onChanged: (value) => setState(() => _category = value),
                        validator: (value) =>
                            value == null ? l10n.pleaseSelectCategory : null,
                      ),

                      const SizedBox(height: 16),

                      // Date Picker
                      InkWell(
                        onTap: () => _selectDate(context),
                        borderRadius: BorderRadius.circular(12),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: l10n.date,
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: theme.colorScheme.surfaceContainerHighest
                                .withAlpha(77),
                          ),
                          child: Text(
                            DateFormat.yMMMd().format(_selectedDate),
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Recurring Switch
                      SwitchListTile(
                        title: Text(l10n.recurring),
                        subtitle: Text(
                          isIncome
                              ? l10n.recurringIncomeDescription
                              : l10n.recurringExpenseDescription,
                          style: theme.textTheme.bodySmall,
                        ),
                        value: _isRecurring,
                        onChanged: (value) =>
                            setState(() => _isRecurring = value),
                        secondary: Icon(
                          Icons.update,
                          color: _isRecurring
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurfaceVariant,
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),

                      const SizedBox(height: 32),

                      // Save Button
                      FilledButton(
                        onPressed: _isLoading ? null : _saveTransaction,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              )
                            : Text(l10n.saveTransaction),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
