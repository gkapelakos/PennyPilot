// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionsHash() => r'd833a98fb9074e2d76a2f8ac7c13b0bbda1cd774';

/// See also [transactions].
@ProviderFor(transactions)
final transactionsProvider =
    AutoDisposeStreamProvider<List<Transaction>>.internal(
  transactions,
  name: r'transactionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$transactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TransactionsRef = AutoDisposeStreamProviderRef<List<Transaction>>;
String _$recentTransactionsHash() =>
    r'be6030de4a58163c263cd214a34cfacc92646e63';

/// See also [recentTransactions].
@ProviderFor(recentTransactions)
final recentTransactionsProvider =
    AutoDisposeStreamProvider<List<Transaction>>.internal(
  recentTransactions,
  name: r'recentTransactionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recentTransactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RecentTransactionsRef = AutoDisposeStreamProviderRef<List<Transaction>>;
String _$transactionNotifierHash() =>
    r'37a7c439e2879830718aa4beffe19a17718de9c1';

/// See also [TransactionNotifier].
@ProviderFor(TransactionNotifier)
final transactionNotifierProvider =
    AutoDisposeAsyncNotifierProvider<TransactionNotifier, void>.internal(
  TransactionNotifier.new,
  name: r'transactionNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransactionNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
