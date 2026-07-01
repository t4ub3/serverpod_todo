// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Navigation)
final navigationProvider = NavigationProvider._();

final class NavigationProvider
    extends $NotifierProvider<Navigation, ValueKey<int>> {
  NavigationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigationHash();

  @$internal
  @override
  Navigation create() => Navigation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValueKey<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ValueKey<int>>(value),
    );
  }
}

String _$navigationHash() => r'2e918b23b5382606bd4ef1a5904485f590e980b6';

abstract class _$Navigation extends $Notifier<ValueKey<int>> {
  ValueKey<int> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ValueKey<int>, ValueKey<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ValueKey<int>, ValueKey<int>>,
              ValueKey<int>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
