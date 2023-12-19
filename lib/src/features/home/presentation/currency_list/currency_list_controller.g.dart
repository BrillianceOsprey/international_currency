// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currencyListControllerHash() =>
    r'3fd4aa6df1824e75b642ee330fd2d3ce1825e093';

/// See also [CurrencyListController].
@ProviderFor(CurrencyListController)
final currencyListControllerProvider = AutoDisposeAsyncNotifierProvider<
    CurrencyListController, List<Currency>>.internal(
  CurrencyListController.new,
  name: r'currencyListControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currencyListControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrencyListController = AutoDisposeAsyncNotifier<List<Currency>>;
String _$getCurrencyControllerHash() =>
    r'f4d93285da91456cd377523310686fa6ed064bf6';

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

abstract class _$GetCurrencyController
    extends BuildlessAutoDisposeAsyncNotifier<Currency?> {
  late final String symbol;

  FutureOr<Currency?> build({
    required String symbol,
  });
}

/// See also [GetCurrencyController].
@ProviderFor(GetCurrencyController)
const getCurrencyControllerProvider = GetCurrencyControllerFamily();

/// See also [GetCurrencyController].
class GetCurrencyControllerFamily extends Family<AsyncValue<Currency?>> {
  /// See also [GetCurrencyController].
  const GetCurrencyControllerFamily();

  /// See also [GetCurrencyController].
  GetCurrencyControllerProvider call({
    required String symbol,
  }) {
    return GetCurrencyControllerProvider(
      symbol: symbol,
    );
  }

  @override
  GetCurrencyControllerProvider getProviderOverride(
    covariant GetCurrencyControllerProvider provider,
  ) {
    return call(
      symbol: provider.symbol,
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
  String? get name => r'getCurrencyControllerProvider';
}

/// See also [GetCurrencyController].
class GetCurrencyControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GetCurrencyController,
        Currency?> {
  /// See also [GetCurrencyController].
  GetCurrencyControllerProvider({
    required String symbol,
  }) : this._internal(
          () => GetCurrencyController()..symbol = symbol,
          from: getCurrencyControllerProvider,
          name: r'getCurrencyControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCurrencyControllerHash,
          dependencies: GetCurrencyControllerFamily._dependencies,
          allTransitiveDependencies:
              GetCurrencyControllerFamily._allTransitiveDependencies,
          symbol: symbol,
        );

  GetCurrencyControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.symbol,
  }) : super.internal();

  final String symbol;

  @override
  FutureOr<Currency?> runNotifierBuild(
    covariant GetCurrencyController notifier,
  ) {
    return notifier.build(
      symbol: symbol,
    );
  }

  @override
  Override overrideWith(GetCurrencyController Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetCurrencyControllerProvider._internal(
        () => create()..symbol = symbol,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        symbol: symbol,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<GetCurrencyController, Currency?>
      createElement() {
    return _GetCurrencyControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCurrencyControllerProvider && other.symbol == symbol;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, symbol.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCurrencyControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Currency?> {
  /// The parameter `symbol` of this provider.
  String get symbol;
}

class _GetCurrencyControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GetCurrencyController,
        Currency?> with GetCurrencyControllerRef {
  _GetCurrencyControllerProviderElement(super.provider);

  @override
  String get symbol => (origin as GetCurrencyControllerProvider).symbol;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
