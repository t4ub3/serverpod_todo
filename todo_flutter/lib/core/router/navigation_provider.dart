import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

part 'navigation_provider.g.dart';

@riverpod
class Navigation extends _$Navigation {
  @override
  ValueKey<int> build() {
    return ValueKey(0);
  }

  ValueKey<int> navigate(ValueKey<int> key) {
    state = key;
    return state;
  }
}
