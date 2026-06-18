import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:todo_client/todo_client.dart';
import 'package:todo_flutter/features/todos/application/todo_list_provider.dart';

class CreateTodoDialog extends ConsumerStatefulWidget {
  const CreateTodoDialog({super.key});

  @override
  ConsumerState<CreateTodoDialog> createState() => _CreateTodoDialogState();
}

class _CreateTodoDialogState extends ConsumerState<CreateTodoDialog> {
  late final _formController = FormController();
  late final _titleController = TextEditingController();
  late final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create todo"),
      actions: [
        Button.outline(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        Button.primary(
          child: const Text('Submit'),
          onPressed: () {
            if (true) {
              final newTodo = Todo(
                title: _titleController.text,
                description: _descriptionController.text,
                isCompleted: false,
                priority: Priority.low,
                // priority: _priorityController.value ?? Priority.low,
              );
              ref.read(todoListProvider.notifier).addTodo(newTodo);
              Navigator.pop(context);
            }
          },
        ),
      ],
      content: Center(
        child: Form(
          controller: _formController,
          child: const FormTableLayout(
            rows: [
              FormField<String>(
                key: FormKey(#title),
                label: Text('Title'),
                child: TextField(
                  initialValue: 'What do you need to do?',
                  autofocus: true,
                ),
              ),
              FormField<String>(
                key: FormKey(#description),
                label: Text('Description'),
                child: TextField(
                  initialValue: 'More details needed?',
                ),
              ),
            ],
          ),
        ).withPadding(vertical: 16),
        //   child: ConstrainedBox(
        //     constraints: const BoxConstraints(maxWidth: 350),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         ShadInputFormField(
        //           controller: _titleController,
        //           id: "title",
        //           label: const Text("Title"),
        //           placeholder: const Text("What do you need to do?"),
        //           validator: (v) {
        //             if (v.length < 2) {
        //               return "Title is required";
        //             }
        //             return null;
        //           },
        //         ),
        //         const SizedBox(height: 16),
        //         ShadInputFormField(
        //           controller: _descriptionController,
        //           id: "description",
        //           label: const Text("Description"),
        //           placeholder: const Text("More details needed?"),
        //         ),
        //         const SizedBox(height: 16),
        //         ShadRadioGroupFormField<Priority>(
        //           controller: _priorityController,
        //           label: Text("Select priority"),
        //           items: Priority.values.map(
        //             (p) => ShadRadio(
        //               value: p,
        //               label: Text(p.displayName),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(height: 16),
        //       ],
        //     ),
        //   ),
      ),
    );
  }
}
