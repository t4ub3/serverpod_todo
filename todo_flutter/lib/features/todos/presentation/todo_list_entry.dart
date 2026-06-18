import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/core/Widgets/badges.dart';

class TodoListEntry extends ConsumerWidget {
  final Todo todo;

  const TodoListEntry(this.todo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShadCard(
        title: Text(todo.title),
        description: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              PriorityBadge(todo),
              SizedBox(
                width: 16,
              ),
              Text(todo.description ?? ""),
            ],
          ),
        ),
        trailing: ShadIconButton.ghost(
          icon: Icon(LucideIcons.trash2),
          iconSize: 32,
        ),
      ),
    );
  }

  IconData getIcon(Priority priority) {
    switch (priority) {
      case Priority.low:
        return Icons.info_outline;
      case Priority.medium:
        return Icons.warning_amber;
      case Priority.high:
        return Icons.error_outline;
    }
  }
}
