import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:todo_flutter/features/todos/presentation/create_todo_dialog.dart';

Key? selected = const ValueKey(0);

class NavigationScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const NavigationScaffold({super.key, required this.navigationShell});

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // Tapping the active tab again returns it to its root.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: navigationShell),
          NavigationBar(
            children: [
              NavigationItem(
                key: const ValueKey(0),
                child: Icon(Icons.add),
              ),
              NavigationItem(
                key: const ValueKey(1),
                child: Icon(Icons.list),
              ),
              NavigationItem(
                key: const ValueKey(2),
                child: Icon(Icons.settings),
              ),
              PrimaryButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => CreateTodoDialog(),
                  );
                },
                child: Icon(Icons.add),
              ),
            ],
          ), // current screen rendered above
          //   Container(
          //     height: 56,
          //     color: const Color(0xFFEEEEEE),
          //     child: Row(
          //       children: [
          //         _NavItem(
          //           label: 'Home',
          //           selected: navigationShell.currentIndex == 0,
          //           onTap: () => _goBranch(0),
          //         ),
          //         _NavItem(
          //           label: 'Settings',
          //           selected: navigationShell.currentIndex == 1,
          //           onTap: () => _goBranch(1),
          //         ),
          //       ],
          //     ),
          //   ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _NavItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: selected
                  ? const Color(0xFF000000)
                  : const Color(0xFF888888),
            ),
          ),
        ),
      ),
    );
  }
}
