import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/features/todos/application/todo_list_provider.dart';

class CreateTodoDialog extends ConsumerStatefulWidget {
  const CreateTodoDialog({super.key});

  @override
  ConsumerState<CreateTodoDialog> createState() => _CreateTodoDialogState();
}

class _CreateTodoDialogState extends ConsumerState<CreateTodoDialog> {
  late final _titleController = TextEditingController();
  late final _descriptionController = TextEditingController();
  late final _priorityController = ShadRadioController<Priority>();
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: const Text("Create todo"),
      actions: [
        ShadButton.outline(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        ShadButton(
          child: const Text('Submit'),
          onPressed: () {
            if (formKey.currentState!.saveAndValidate()) {
              final newTodo = Todo(
                title: _titleController.text,
                description: _descriptionController.text,
                isCompleted: false,
                priority: _priorityController.value ?? Priority.low,
              );
              ref.read(todoListProvider.notifier).addTodo(newTodo);
              Navigator.pop(context);
            }
          },
        ),
      ],
      child: Center(
        child: ShadForm(
          key: formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadInputFormField(
                  controller: _titleController,
                  id: "title",
                  label: const Text("Title"),
                  placeholder: const Text("What do you need to do?"),
                  validator: (v) {
                    if (v.length < 2) {
                      return "Title is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ShadInputFormField(
                  controller: _descriptionController,
                  id: "description",
                  label: const Text("Description"),
                  placeholder: const Text("More details needed?"),
                ),
                const SizedBox(height: 16),
                ShadRadioGroupFormField<Priority>(
                  controller: _priorityController,
                  label: Text("Select priority"),
                  items: Priority.values.map(
                    (p) => ShadRadio(
                      value: p,
                      label: Text(p.displayName),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
