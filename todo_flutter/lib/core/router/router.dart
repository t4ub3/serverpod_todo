import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:todo_flutter/core/router/navigation_scaffold.dart';
import 'package:todo_flutter/features/settings/presentation/settings_screen.dart';
import 'package:todo_flutter/features/todos/presentation/todo_list.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final GoRouter router = GoRouter(
  initialLocation: "/home",
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (BuildContext context, GoRouterState state) {
                return const TodoList();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (BuildContext context, GoRouterState state) {
                return const SettingsScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
  //   routes: <RouteBase>[
  //     GoRoute(
  //       path: '/home',
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const TodoList();
  //       },
  //     ),
  //     GoRoute(
  //       path: '/settings',
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const SettingsScreen();
  //       },
  //     ),
  //   ],
);

class TodoListRoute extends GoRouteData with $TodoListRoute {
  const TodoListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const TodoList();
}
