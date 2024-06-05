import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_genius/modules/sessions/sessions_screen.dart';

late final GoRouter router;



class Router {
  /// The route configuration.
  final GoRouter router = GoRouter(

    routes: <RouteBase>[
      GoRoute(
        path: RouteConstants.sessionScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SessionsScreen();
        },
      ),
    ],
  );
}

abstract class RouteConstants{

 static String sessionScreen = '/';

}