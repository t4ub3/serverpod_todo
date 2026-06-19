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
  final _titleKey = TextFieldKey("title");
  final _descriptionKey = TextFieldKey("description");
  final _priorityKey = RadioGroupKey("priority");

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 350),
      child: AlertDialog(
        title: const Text("Create todo"),
        content: Form(
          onSubmit: (context, values) {
            final newTodo = Todo(
              title: _titleKey[values]!,
              description: _descriptionKey[values],
              isCompleted: false,
              priority: Priority.low,
            );

            ref.read(todoListProvider.notifier).addTodo(newTodo);
            Navigator.pop(context);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormField<String>(
                key: _titleKey,
                label: Text('Title'),
                validator: NotEmptyValidator(),
                child: TextField(
                  placeholder: Text('What do you need to do?'),
                  autofocus: true,
                ),
              ),
              FormField<String>(
                key: _descriptionKey,
                label: Text('Description'),
                child: TextField(
                  placeholder: Text('More details needed?'),
                ),
              ),
              const Gap(16),
              const Divider(),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button.outline(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Gap(16),
                  FormErrorBuilder(
                    builder: (context, errors, child) {
                      return Button.primary(
                        onPressed: errors.isEmpty
                            ? () => context.submitForm()
                            : null,
                        child: const Text('Submit'),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
