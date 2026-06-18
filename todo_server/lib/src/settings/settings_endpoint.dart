import 'package:serverpod/serverpod.dart';
import 'package:todo_server/src/generated/settings/config.dart';

class SettingsEndpoint extends Endpoint {
  Future<List<Config>> getAll(Session session) async {
    return Config.db.find(session);
  }

  Future<Config?> getById(Session session, int id) async {
    return Config.db.findById(session, id);
  }

  Future<Config> add(Session session, Config config) async {
    return await Config.db.insertRow(session, config);
  }

  Future<Config> deleteSingle(Session session, Config config) async {
    return Config.db.deleteRow(session, config);
  }
}
