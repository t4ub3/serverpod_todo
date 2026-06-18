import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/core/theme/nord_color_scheme.dart';

class PriorityBadge extends StatelessWidget {
  const PriorityBadge(this.todo, {super.key});

  final Todo todo;

  Color get _color {
    return switch (todo.priority) {
      Priority.low => Nord.auroraGreen,
      Priority.medium => Nord.auroraYellow,
      Priority.high => Nord.auroraOrange,
    };
  }

  @override
  Widget build(BuildContext context) {
    return ShadBadge(
      backgroundColor: todo.isCompleted
          ? ShadTheme.of(context).colorScheme.muted
          : _color,
      child: Text(todo.priority.displayName),
    );
  }
}
