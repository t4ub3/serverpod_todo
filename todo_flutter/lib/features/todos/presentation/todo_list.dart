import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/features/todos/application/todo_list_provider.dart';
import 'package:todo_flutter/features/todos/presentation/edit_todo_dialog.dart';
import 'package:todo_flutter/features/todos/presentation/todo_list_item.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("TODOS"),
      ),
      body: todos.when(
        data: (todos) {
          todos.sort((a, b) => b.priority.index.compareTo(a.priority.index));
          final currentTodos = todos.where((t) => !t.isCompleted).toList();
          final completedTodos = todos.where((t) => t.isCompleted).toList();
          return Column(
            children: [
              ListView.builder(
                itemCount: currentTodos.length,
                itemBuilder: (context, index) {
                  final todo = currentTodos[index];
                  return TodoListitem(todo);
                },
              ),
              Text("Completed todos:"),
              ListView.builder(
                itemCount: completedTodos.length,
                itemBuilder: (context, index) {
                  final todo = completedTodos[index];
                  return TodoListitem(todo);
                },
              ),
            ],
          );
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => EditTodo(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
