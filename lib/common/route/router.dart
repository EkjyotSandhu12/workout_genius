import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_genius/common/common_dtos/session/session_dto.dart';
import 'package:workout_genius/common/route/route_middleware.dart';
import 'package:workout_genius/modules/session_exection/session_execution_screen.dart';
import 'package:workout_genius/modules/sessions/sessions_screen.dart';

import '../services/reponsive_framework_service.dart';

Widget _myRouteBuilder(BuildContext context, GoRouterState state, Widget child) {
  return ResponsiveFrameworkService().globalResponsive(context, child:  child);
}

final GoRouter router = GoRouter(
  redirect: RouteMiddleware.routeMiddleware,
  routes: <RouteBase>[
    GoRoute(
      path: RouteConstants.sessionScreen,
      builder: (context, state) => _myRouteBuilder(context,
        state,
        SessionsScreen(),
      ),
    ),
    GoRoute(
      path: RouteConstants.sessionExecutionScreen,
      builder: (context, state) => _myRouteBuilder(context,
        state,
        SessionExecutionScreen(session: state.extra as SessionDto),
      ),
    ),
  ],
);

abstract class RouteConstants {
  static String sessionScreen = '/';
  static String sessionExecutionScreen = '/sessionExecutionScreen';
}
