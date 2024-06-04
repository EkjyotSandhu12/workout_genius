// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:workout_genius/modules/session_exection/session_execution_screen.dart'
    as _i1;
import 'package:workout_genius/modules/sessions/sessions_screen.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SessionExecutionRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SessionExecutionScreen(),
      );
    },
    SessionsRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SessionsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.SessionExecutionScreen]
class SessionExecutionRoute extends _i3.PageRouteInfo<void> {
  const SessionExecutionRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SessionExecutionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionExecutionRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SessionsScreen]
class SessionsRoute extends _i3.PageRouteInfo<void> {
  const SessionsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SessionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionsRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
