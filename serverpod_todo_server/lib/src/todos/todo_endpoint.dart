import 'package:serverpod/serverpod.dart';
import 'package:serverpod_todo_server/src/generated/protocol.dart';

class TodoEndpoint extends Endpoint {
  Future<List<Todo>> getAll(Session session) async {
    return Todo.db.find(session);
  }

  Future<Todo?> getById(Session session, int id) async {
    return Todo.db.findById(session, id);
  }

  Future<List<Todo>> getByPriorities(
    Session session,
    List<Priority> priorities,
  ) async {
    return Todo.db.find(
      session,
      where: (t) => t.priority.inSet(priorities.toSet()),
    );
  }

  Future<Todo> add(Session session, Todo todo) async {
    return await Todo.db.insertRow(session, todo);
  }

  Future<Todo> updateOrAddIfNotExist(Session session, Todo todo) async {
    if (todo.id != null) {
      Todo? currentTodo = await Todo.db.findById(session, todo.id!);
      if (currentTodo != null) {
        currentTodo = todo;
        final newTodo = await Todo.db.updateRow(session, currentTodo);
        return newTodo;
      }
    }
    return await Todo.db.insertRow(session, todo);
  }
}
