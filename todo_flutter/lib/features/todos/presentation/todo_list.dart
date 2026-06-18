import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/features/todos/application/todo_list_provider.dart';
import 'package:todo_flutter/features/todos/presentation/create_todo_dialog.dart';
import 'package:todo_flutter/features/todos/presentation/todo_list_entry.dart';
import 'package:todo_flutter/features/todos/presentation/todo_list_item.dart';
import 'package:todo_flutter/features/todos/presentation/todo_list_section_header.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  List<TodoListItem> _buildItems(List<Todo> todos) {
    todos.sort((a, b) => b.priority.index.compareTo(a.priority.index));
    final openTodos = todos.where((t) => !t.isCompleted).toList();
    final completedTodos = todos.where((t) => t.isCompleted).toList();
    final items = <TodoListItem>[];

    if (openTodos.isNotEmpty) {
      items.add(TodoHeaderItem('Open'));
      items.addAll(openTodos.map(TodoEntryItem.new));
    }

    if (completedTodos.isNotEmpty) {
      items.add(TodoHeaderItem('Completed'));
      items.addAll(completedTodos.map(TodoEntryItem.new));
    }

    return items;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);

    return Scaffold(
      headers: [
        AppBar(
          title: Text("TODOS"),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ],
      footers: [
        const Divider(),
        NavigationBar(
          children: [
            NavigationItem(
              key: key,
              child: Icon(Icons.add),
            ),
            PrimaryButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => CreateTodoDialog(),
                );
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ],
      child: todos.when(
        data: (todos) {
          if (todos.isEmpty) {
            return Center(child: Text("Keine Todos"));
          } else {
            final items = _buildItems(todos);
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return switch (item) {
                  TodoHeaderItem(title: final title) => TodoListSectionHeader(
                    title,
                  ),
                  TodoEntryItem(todo: final todo) => TodoListEntry(todo),
                };
              },
            );
          }
        },
        error: (e, _) {
          return Center(
            child: Text("Error: $e"),
          );
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
