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
        child: Basic(
          title: Text(todo.title).h4,
          subtitle: Text(todo.description ?? "").base,
          content: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: _getBadge(todo),
          ),
          trailing: GhostButton(
            child: Icon(LucideIcons.trash2),
          ),
        ),
      ),
    );
  }

  Widget _getBadge(Todo todo) {
    final label = Text(todo.priority.displayName);
    if (todo.isCompleted) {
      return SecondaryBadge(child: label);
    }
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
