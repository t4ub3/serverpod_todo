import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/features/todos/application/todo_list_provider.dart';
import 'package:todo_flutter/features/todos/presentation/edit_todo_dialog.dart';

class TodoListitem extends ConsumerWidget {
  final Todo todo;

  const TodoListitem(this.todo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final icon = getIcon(todo.priority);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  todo.title,
                  style: TextStyle(fontSize: 16),
                ),
                Text(todo.description ?? "-"),
              ],
            ),
          ),
          IconButton(
            onPressed: () => {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => EditTodo(),
              ),
            },
            icon: Icon(Icons.edit),
          ),
          Checkbox(
            value: todo.isCompleted,
            onChanged: (_) =>
                ref.read(todoListProvider.notifier).toggleTodo(todo),
          ),
        ],
      ),
      //   child: ListTile(
      //     title: Text(todo.title),
      //     subtitle: Text(todo.description ?? "-"),
      //     trailing: Row(
      //       children: [
      //         IconButton(
      //           onPressed: () => {
      //             showDialog(
      //               barrierDismissible: false,
      //               context: context,
      //               builder: (context) => EditTodo(),
      //             ),
      //           },
      //           icon: Icon(Icons.edit),
      //         ),
      //         Checkbox(
      //           value: todo.isCompleted,
      //           onChanged: (_) =>
      //               ref.read(todoListProvider.notifier).toggleTodo(todo),
      //         ),
      //       ],
      //     ),
      //     onLongPress: () => {
      //       showDialog(
      //         barrierDismissible: false,
      //         context: context,
      //         builder: (context) => EditTodo(),
      //       ),
      //     },
      //     shape: Border(
      //       left: BorderSide(
      //         color: Color(todo.priority.color),
      //         // color: color4,
      //         width: 3,
      //       ),
      //     ),
      //     hoverColor: Color(todo.priority.colorTransparent),
      //   ),
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
