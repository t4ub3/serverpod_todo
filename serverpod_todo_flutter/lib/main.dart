import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_todo_client/serverpod_todo_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_todo_flutter/core/serverpod_client.dart';

/// Sets up a global client object that can be used to talk to the server from
/// anywhere in our app. The client is generated from your server code
/// and is set up to connect to a Serverpod running on a local server on
/// the default port. You will need to modify this to connect to staging or
/// production servers.
/// In a larger app, you may want to use the dependency injection of your choice
/// instead of using a global client object. This is just a simple example.
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
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const Scaffold(),
    );
  }
}
