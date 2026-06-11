import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_todo_client/serverpod_todo_client.dart';
import 'package:serverpod_todo_flutter/features/todos/data/todo_repository.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  Future<List<Todo>> build() {
    return ref.watch(todoRepositoryProvider).fetchTodos();
  }

  Future<void> addTodo(Todo todo) async {
    final created = await ref.read(todoRepositoryProvider).createTodo(todo);
    final current = await future;
    state = AsyncData([...current, created]);
  }

  Future<void> toggleTodo(Todo todo) async {
    final updated = await ref.read(todoRepositoryProvider).toggleTodo(todo);
    final current = await future;
    state = AsyncData([
      for (final t in current) t.id == updated.id ? updated : t,
    ]);
  }
}
