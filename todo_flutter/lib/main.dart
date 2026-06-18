import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:todo_client/todo_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:todo_flutter/core/serverpod_client.dart';
import 'package:todo_flutter/core/theme/nord_color_scheme.dart';
import 'package:todo_flutter/features/todos/presentation/todo_list.dart';

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
    return ShadApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: nordLightColorScheme,
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: nordDarkColorScheme,
      ),
      themeMode: ThemeMode.light,
      home: const TodoList(),
    );
  }
}
