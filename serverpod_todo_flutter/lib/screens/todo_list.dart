import 'package:flutter/material.dart';
import 'package:serverpod_todo_client/serverpod_todo_client.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = Todo(
      title: "title",
      isCompleted: false,
      priority: Priority.low,
    );
    final newTodo = todo.copyWith(title: "new Title");
    return const Placeholder();
  }
}
