// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splits_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$splitsForTransactionHash() =>
    r'bfa1ddc293d7cd6ece59a1c233f552e641bdb9eb';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [splitsForTransaction].
@ProviderFor(splitsForTransaction)
const splitsForTransactionProvider = SplitsForTransactionFamily();

/// See also [splitsForTransaction].
class SplitsForTransactionFamily extends Family<AsyncValue<List<Split>>> {
  /// See also [splitsForTransaction].
  const SplitsForTransactionFamily();

  /// See also [splitsForTransaction].
  SplitsForTransactionProvider call(
    int transactionId,
  ) {
    return SplitsForTransactionProvider(
      transactionId,
    );
  }

  @override
  SplitsForTransactionProvider getProviderOverride(
    covariant SplitsForTransactionProvider provider,
  ) {
    return call(
      provider.transactionId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'splitsForTransactionProvider';
}

/// See also [splitsForTransaction].
class SplitsForTransactionProvider
    extends AutoDisposeStreamProvider<List<Split>> {
  /// See also [splitsForTransaction].
  SplitsForTransactionProvider(
    int transactionId,
  ) : this._internal(
          (ref) => splitsForTransaction(
            ref as SplitsForTransactionRef,
            transactionId,
          ),
          from: splitsForTransactionProvider,
          name: r'splitsForTransactionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$splitsForTransactionHash,
          dependencies: SplitsForTransactionFamily._dependencies,
          allTransitiveDependencies:
              SplitsForTransactionFamily._allTransitiveDependencies,
          transactionId: transactionId,
        );

  SplitsForTransactionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.transactionId,
  }) : super.internal();

  final int transactionId;

  @override
  Override overrideWith(
    Stream<List<Split>> Function(SplitsForTransactionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SplitsForTransactionProvider._internal(
        (ref) => create(ref as SplitsForTransactionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        transactionId: transactionId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Split>> createElement() {
    return _SplitsForTransactionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SplitsForTransactionProvider &&
        other.transactionId == transactionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, transactionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SplitsForTransactionRef on AutoDisposeStreamProviderRef<List<Split>> {
  /// The parameter `transactionId` of this provider.
  int get transactionId;
}

class _SplitsForTransactionProviderElement
    extends AutoDisposeStreamProviderElement<List<Split>>
    with SplitsForTransactionRef {
  _SplitsForTransactionProviderElement(super.provider);

  @override
  int get transactionId =>
      (origin as SplitsForTransactionProvider).transactionId;
}

String _$splitNotifierHash() => r'458dd04385f6f8fc82310578893fa461d220521f';

/// See also [SplitNotifier].
@ProviderFor(SplitNotifier)
final splitNotifierProvider =
    AutoDisposeAsyncNotifierProvider<SplitNotifier, void>.internal(
  SplitNotifier.new,
  name: r'splitNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$splitNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SplitNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
