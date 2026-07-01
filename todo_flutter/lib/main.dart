import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:todo_client/todo_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:todo_flutter/core/router/router.dart';
import 'package:todo_flutter/core/serverpod_client.dart';
import 'package:todo_flutter/core/theme/shadcn_nord_color_theme.dart';

late final Client client;

late String serverUrl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final url = await getServerUrl();
  final client = Client(url)
    ..connectivityMonitor = FlutterConnectivityMonitor();

  runApp(
    ProviderScope(
      overrides: [serverpodClientProvider.overrideWithValue(client)],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadcnApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: nordLightTheme,
      darkTheme: nordDarkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: router,
    );
  }
}
