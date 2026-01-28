// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesHash() => r'44eff66754e4c520db32ee86372e65f19f6a9eff';

/// See also [categories].
@ProviderFor(categories)
final categoriesProvider = AutoDisposeStreamProvider<List<Category>>.internal(
  categories,
  name: r'categoriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CategoriesRef = AutoDisposeStreamProviderRef<List<Category>>;
String _$categoryNotifierHash() => r'bdd168fa017834b1292afdd3f15cb0d3c0806e92';

/// See also [CategoryNotifier].
@ProviderFor(CategoryNotifier)
final categoryNotifierProvider =
    AutoDisposeAsyncNotifierProvider<CategoryNotifier, void>.internal(
  CategoryNotifier.new,
  name: r'categoryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
