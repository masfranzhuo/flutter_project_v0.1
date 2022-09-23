import 'package:flutter/material.dart';
import 'package:flutter_project/src/presentation/pages/home_page/home_page.dart';
import 'package:flutter_project/src/presentation/pages/user_detail_page/user_detail_page.dart';
import 'package:flutter_project/src/presentation/pages/users_page/users_page.dart';
import 'package:go_router/go_router.dart';

class RoutesConfig {
  static GoRouter router({String initialLocation = '/', debug = false}) {
    return GoRouter(
      initialLocation: initialLocation,
      debugLogDiagnostics: debug,
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const UsersPage();
          },
          routes: <GoRoute>[
            GoRoute(
              path: 'user-detail/:id',
              builder: (BuildContext context, GoRouterState state) {
                final id = state.params['id'];
                return UserDetailPage(id: id!);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
      ],
    );
  }
}