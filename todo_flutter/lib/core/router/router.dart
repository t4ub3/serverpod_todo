import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:todo_flutter/core/router/navigation_scaffold.dart';
import 'package:todo_flutter/features/settings/presentation/settings_screen.dart';
import 'package:todo_flutter/features/todos/presentation/create_todo_screen.dart';
import 'package:todo_flutter/features/todos/presentation/todo_list.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
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
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/add',
              builder: (BuildContext context, GoRouterState state) {
                return const CreateTodoScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
