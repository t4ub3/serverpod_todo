import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/core/serverpod_client.dart';

part 'settings_repository.g.dart';

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) {
  return SettingsRepository(ref.watch(serverpodClientProvider));
}

class SettingsRepository {
  SettingsRepository(this._client);
  final Client _client;

  Future<List<Config>> fetchConfigs() => _client.settings.getAll();
  Future<Config> createConfig(Config config) => _client.settings.add(config);
  Future<Config?> getConfigById(int id) => _client.settings.getById(id);
  Future<Config> deleteConfig(Config config) =>
      _client.settings.deleteSingle(config);
}
