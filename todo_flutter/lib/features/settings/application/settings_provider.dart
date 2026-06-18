import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/features/settings/data/settings_repository.dart';

part 'settings_provider.g.dart';

@riverpod
class Settings extends _$Settings {
  @override
  Future<List<Config>> build() {
    return ref.watch(settingsRepositoryProvider).fetchConfigs();
  }
}
