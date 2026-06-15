import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_client/todo_client.dart';

part 'serverpod_client.g.dart';

// When you are running the app on a physical device, you need to set the
// server URL to the IP address of your computer. You can find the IP
// address by running `ipconfig` on Windows or `ifconfig` on Mac/Linux.
//
// You can set the variable when running or building your app like this:
// E.g. `flutter run --dart-define=SERVER_URL=https://api.example.com/`.
//
// Otherwise, the server URL is fetched from the assets/config.json file or
// defaults to http://$localhost:8080/ if not found.

@Riverpod(keepAlive: true)
Client serverpodClient(Ref ref) {
  // Always overridden in main(); this body never runs.
  throw UnimplementedError();
}
