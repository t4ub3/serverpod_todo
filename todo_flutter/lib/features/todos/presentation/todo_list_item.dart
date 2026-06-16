import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hux/hux.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/core/Widgets/badges.dart';
import 'package:todo_flutter/core/variables/colors.dart';
import 'package:todo_flutter/features/todos/application/todo_list_provider.dart';
import 'package:todo_flutter/features/todos/presentation/edit_todo_dialog.dart';

class TodoListitem extends ConsumerWidget {
  final Todo todo;

  const TodoListitem(this.todo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: HuxCard(
        title: todo.title,
        action: HuxButton(
          onPressed: () => todo.isCompleted
              ? {}
              : {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => EditTodo(todo: todo),
                  ),
                },
          variant: HuxButtonVariant.ghost,
          size: HuxButtonSize.small,
          isDisabled: todo.isCompleted,
          child: Icon(Icons.edit),
        ),
        onTap: () => ref.read(todoListProvider.notifier).toggleTodo(todo),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.description ?? "-"),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [priorityBadge(todo)],
            ),
          ],
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
