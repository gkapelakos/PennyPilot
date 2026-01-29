// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$subscriptionManagementHash() =>
    r'd7c656a10d41d95a70d2c19b0b5b8aa5dda75e97';

/// See also [SubscriptionManagement].
@ProviderFor(SubscriptionManagement)
final subscriptionManagementProvider =
    AutoDisposeAsyncNotifierProvider<SubscriptionManagement, void>.internal(
  SubscriptionManagement.new,
  name: r'subscriptionManagementProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$subscriptionManagementHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SubscriptionManagement = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
