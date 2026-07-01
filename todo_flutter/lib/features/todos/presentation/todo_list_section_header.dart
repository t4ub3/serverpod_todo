import 'package:shadcn_flutter/shadcn_flutter.dart';

class TodoListSectionHeader extends StatelessWidget {
  final String title;
  const TodoListSectionHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20),
          ).muted,
          const Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
