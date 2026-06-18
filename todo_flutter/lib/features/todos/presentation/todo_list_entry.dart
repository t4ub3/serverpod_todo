import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/core/theme/shadcn_nord_color_theme.dart';

class TodoListEntry extends ConsumerWidget {
  final Todo todo;

  const TodoListEntry(this.todo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(todo.title),
                  Text(todo.description ?? ""),
                  _getBadge(todo),
                ],
              ),
            ),
            GhostButton(child: Icon(LucideIcons.trash2)),
          ],
        ),
        //     title: Text(todo.title),
        //     description: Padding(
        //       padding: const EdgeInsets.only(top: 8.0),
        //       child: Row(
        //         children: [
        //           PriorityBadge(todo),
        //           SizedBox(
        //             width: 16,
        //           ),
        //           Text(todo.description ?? ""),
        //         ],
        //       ),
        //     ),
        //     trailing: ShadIconButton.ghost(
        //       icon: Icon(LucideIcons.trash2),
        //       iconSize: 32,
        //     ),
        //   ),
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

  AuroraBadge _getBadge(Todo todo) {
    final label = Text(todo.priority.displayName);
    switch (todo.priority) {
      case Priority.low:
        return AuroraBadge.success(child: label);
      case Priority.medium:
        return AuroraBadge.warning(child: label);
      case Priority.high:
        return AuroraBadge.danger(child: label);
    }
  }
}
