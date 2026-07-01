import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:todo_flutter/core/router/navigation_provider.dart';

//Key? selected = const ValueKey(0);

class NavigationScaffold extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;
  const NavigationScaffold({super.key, required this.navigationShell});

  void _goBranch(ValueKey<int> key, WidgetRef ref) {
    ref.read(navigationProvider.notifier).navigate(key);
    navigationShell.goBranch(
      key.value,
      initialLocation: key.value == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Key selected = ref.watch(navigationProvider);
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: navigationShell),
          NavigationBar(
            alignment: NavigationBarAlignment.spaceEvenly,
            selectedKey: selected,
            onSelected: (key) {
              final valueKey = key as ValueKey<int>;
              _goBranch(valueKey, ref);
            },
            children: [
              NavigationItem(
                key: const ValueKey(0),
                child: Icon(Icons.list),
              ),
              NavigationItem(
                key: const ValueKey(1),
                child: Icon(Icons.settings),
              ),
              NavigationItem(
                key: const ValueKey(2),
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
