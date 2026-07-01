import 'package:flutter/material.dart';

class DefaultAppbar extends StatelessWidget {
  final String title;
  const DefaultAppbar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(child: Text(title.toUpperCase())),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
