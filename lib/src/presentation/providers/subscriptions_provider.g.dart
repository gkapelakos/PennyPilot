// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subscriptionsHash() => r'9ac2c68ca6ad408b05679c39e25d3bb73b4522aa';

/// See also [subscriptions].
@ProviderFor(subscriptions)
final subscriptionsProvider =
    AutoDisposeStreamProvider<List<Subscription>>.internal(
  subscriptions,
  name: r'subscriptionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$subscriptionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SubscriptionsRef = AutoDisposeStreamProviderRef<List<Subscription>>;
String _$subscriptionNotifierHash() =>
    r'329df2b38af02755777ea03d166da6a2060f9ce9';

/// See also [SubscriptionNotifier].
@ProviderFor(SubscriptionNotifier)
final subscriptionNotifierProvider =
    AutoDisposeAsyncNotifierProvider<SubscriptionNotifier, void>.internal(
  SubscriptionNotifier.new,
  name: r'subscriptionNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$subscriptionNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SubscriptionNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
