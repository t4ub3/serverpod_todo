import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_todo_client/serverpod_todo_client.dart';
import 'package:serverpod_todo_flutter/core/serverpod_client.dart';

part 'todo_repository.g.dart';

@Riverpod(keepAlive: true)
TodoRepository todoRepository(Ref ref) {
  return TodoRepository(ref.watch(serverpodClientProvider));
}

class TodoRepository {
  TodoRepository(this._client);
  final Client _client;

  Future<List<Todo>> fetchTodos() => _client.todo.getAll();
  Future<Todo> createTodo(Todo todo) => _client.todo.add(todo);
  Future<Todo> toggleTodo(Todo todo) =>
      _client.todo.updateOrAddIfNotExist(todo);
}
