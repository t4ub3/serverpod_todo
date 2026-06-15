import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/features/todos/application/todo_list_provider.dart';

class EditTodo extends ConsumerWidget {
  EditTodo({super.key});
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: Container(
        margin: EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Edit Todo',
              style: TextStyle(fontSize: 32),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_titleController.text.isEmpty ||
                        _descriptionController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Title and description cannot be empty',
                          ),
                        ),
                      );
                      return;
                    } else {
                      final newTodo = Todo(
                        id: DateTime.now().millisecondsSinceEpoch,
                        title: _titleController.text,
                        description: _descriptionController.text,
                        isCompleted: false,
                        priority: Priority.low,
                      );
                      ref.read(todoListProvider.notifier).addTodo(newTodo);
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
