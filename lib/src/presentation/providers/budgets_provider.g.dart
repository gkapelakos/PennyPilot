// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budgets_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$budgetsHash() => r'963b4502b55ab1329cc709e16c73856b7bfc5afb';

/// See also [budgets].
@ProviderFor(budgets)
final budgetsProvider = AutoDisposeStreamProvider<List<Budget>>.internal(
  budgets,
  name: r'budgetsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$budgetsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BudgetsRef = AutoDisposeStreamProviderRef<List<Budget>>;
String _$budgetNotifierHash() => r'5c182362e3128e3f0e3a339fd112f7924913232c';

/// See also [BudgetNotifier].
@ProviderFor(BudgetNotifier)
final budgetNotifierProvider =
    AutoDisposeAsyncNotifierProvider<BudgetNotifier, void>.internal(
  BudgetNotifier.new,
  name: r'budgetNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$budgetNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BudgetNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
