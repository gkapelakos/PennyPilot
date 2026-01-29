// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_streams.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allTransactionsHash() => r'1b02437c0f0d09efe0f382fabe78f67b5b9ebc91';

/// See also [allTransactions].
@ProviderFor(allTransactions)
final allTransactionsProvider =
    AutoDisposeStreamProvider<List<Transaction>>.internal(
  allTransactions,
  name: r'allTransactionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allTransactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllTransactionsRef = AutoDisposeStreamProviderRef<List<Transaction>>;
String _$allReceiptsHash() => r'b7e6fd5ce7839aac0cf44173c646dbe22202fdf8';

/// See also [allReceipts].
@ProviderFor(allReceipts)
final allReceiptsProvider = AutoDisposeStreamProvider<List<Receipt>>.internal(
  allReceipts,
  name: r'allReceiptsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allReceiptsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllReceiptsRef = AutoDisposeStreamProviderRef<List<Receipt>>;
String _$allSubscriptionsHash() => r'830eb548f5098585cf726b4ce6e8515d156809a4';

/// See also [allSubscriptions].
@ProviderFor(allSubscriptions)
final allSubscriptionsProvider =
    AutoDisposeStreamProvider<List<Subscription>>.internal(
  allSubscriptions,
  name: r'allSubscriptionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allSubscriptionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllSubscriptionsRef = AutoDisposeStreamProviderRef<List<Subscription>>;
String _$monthlySubscriptionTotalHash() =>
    r'1dff3ec9e0617ea48091910027c472589a7426ad';

/// See also [monthlySubscriptionTotal].
@ProviderFor(monthlySubscriptionTotal)
final monthlySubscriptionTotalProvider =
    AutoDisposeStreamProvider<double>.internal(
  monthlySubscriptionTotal,
  name: r'monthlySubscriptionTotalProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$monthlySubscriptionTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MonthlySubscriptionTotalRef = AutoDisposeStreamProviderRef<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
