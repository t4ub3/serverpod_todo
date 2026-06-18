import 'package:todo_client/todo_client.dart';

sealed class TodoListItem {}

class TodoHeaderItem extends TodoListItem {
  final String title;
  TodoHeaderItem(this.title);
}

class TodoEntryItem extends TodoListItem {
  final Todo todo;
  TodoEntryItem(this.todo);
}
