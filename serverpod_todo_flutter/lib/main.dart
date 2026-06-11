import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_todo_client/serverpod_todo_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_todo_flutter/core/serverpod_client.dart';
import 'package:serverpod_todo_flutter/features/todos/presentation/todo_list.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal.shade200,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const TodoList(),
    );
  }
}
