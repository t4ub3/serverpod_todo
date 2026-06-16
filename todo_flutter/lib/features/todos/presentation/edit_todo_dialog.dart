import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hux/hux.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/features/todos/application/todo_list_provider.dart';

class EditTodo extends ConsumerStatefulWidget {
  const EditTodo({super.key, this.todo}); // pass a todo to edit, omit to create
  final Todo? todo;

  @override
  ConsumerState<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends ConsumerState<EditTodo> {
  late final _titleController = TextEditingController(
    text: widget.todo?.title,
  );
  late final _descriptionController = TextEditingController(
    text: widget.todo?.description,
  );
  late Priority _selectedPriority = widget.todo?.priority ?? Priority.low;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HuxDialog(
      title: widget.todo == null ? "Add Todo" : "Edit Todo",
      content: Container(
        margin: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HuxInput(
              controller: _titleController,
              label: 'Title',
              hint: "What do you need to do?",
              errorText: "Title is required",
              validator: (title) {
                if (title == null || title.isEmpty) return 'Title is required';
                return null;
              },
            ),
            HuxInput(
              controller: _descriptionController,
              label: 'Description',
              hint: "More details needed?",
            ),
            SizedBox(height: 18),
            HuxCard(
              subtitle: "Priority",
              child: Row(
                children: [
                  for (final prio in Priority.values)
                    HuxRadio<Priority>(
                      value: prio,
                      groupValue: _selectedPriority,
                      onChanged: (value) =>
                          setState(() => _selectedPriority = value!),
                      label: prio.displayName,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        HuxButton(
          variant: HuxButtonVariant.outline,
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        const SizedBox(width: 8),
        HuxButton(onPressed: _save, child: const Text('Save')),
      ],
    );
  }

  void _save() {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title cannot be empty')),
      );
      return;
    }

    final newTodo = Todo(
      title: _titleController.text,
      description: _descriptionController.text,
      isCompleted: widget.todo?.isCompleted ?? false,
      priority: _selectedPriority,
    );

    if (widget.todo == null) {
      ref.read(todoListProvider.notifier).addTodo(newTodo);
    }
    //TODO: Implement update Todo!!

    Navigator.pop(context);
  }
}
