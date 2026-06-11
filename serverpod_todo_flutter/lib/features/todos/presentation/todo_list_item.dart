import 'package:flutter/material.dart';
import 'package:serverpod_todo_client/serverpod_todo_client.dart';

class TodoListitem extends StatelessWidget {
  final Todo todo;

  const TodoListitem(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    final icon = getIcon(todo.priority);
    return ListTile(
      leading: Icon(icon),
      title: Text(todo.title),
      subtitle: Text(todo.description ?? "-"),
      trailing: Checkbox(value: todo.isCompleted, onChanged: (bool? value) {}),
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
