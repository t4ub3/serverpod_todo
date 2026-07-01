import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:todo_flutter/core/Widgets/default_appbar.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      headers: [
        DefaultAppbar("settings"),
      ],
      child: Center(
        child: Text(
          "Settings\nScreen",
          textAlign: TextAlign.center,
        ).h3,
      ),
    );
  }
}
