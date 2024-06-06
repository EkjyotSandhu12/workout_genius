import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_genius/common/common_dtos/session/session_dto.dart';
import 'package:workout_genius/common/route/route_middleware.dart';
import 'package:workout_genius/modules/session_exection/session_execution_screen.dart';
import 'package:workout_genius/modules/sessions/sessions_screen.dart';

final GoRouter router = GoRouter(
  redirect: RouteMiddleware.routeMiddleware,
  routes: <RouteBase>[
    GoRoute(
      path: RouteConstants.sessionScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SessionsScreen();
      },
    ),
    GoRoute(
      path: RouteConstants.sessionExecutionScreen,
      builder: (BuildContext context, GoRouterState state) {
        return SessionExecutionScreen(session: state.extra as SessionDto);
      },
    ),
  ],
);

abstract class RouteConstants {
  static String sessionScreen = '/';
  static String sessionExecutionScreen = '/sessionExecutionScreen';
}
