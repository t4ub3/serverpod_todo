import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_todo_client/serverpod_todo_client.dart';
import 'package:serverpod_todo_flutter/features/todos/application/todo_list_provider.dart';

class TodoListitem extends ConsumerWidget {
  final Todo todo;

  const TodoListitem(this.todo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icon = getIcon(todo.priority);
    return ListTile(
      leading: Icon(icon),
      iconColor: Color(int.parse(todo.priority.color)),
      title: Text(todo.title),
      subtitle: Text(todo.description ?? "-"),
      trailing: Checkbox(
        value: todo.isCompleted,
        onChanged: (_) => ref.read(todoListProvider.notifier).toggleTodo(todo),
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
