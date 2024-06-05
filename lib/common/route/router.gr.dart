// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:workout_genius/common/common_dtos/session/session_dto.dart'
    as _i5;
import 'package:workout_genius/modules/session_exection/session_execution_screen.dart'
    as _i1;
import 'package:workout_genius/modules/sessions/sessions_screen.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SessionExecutionRoute.name: (routeData) {
      final args = routeData.argsAs<SessionExecutionRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.SessionExecutionScreen(
          key: args.key,
          session: args.session,
        ),
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
class SessionExecutionRoute
    extends _i3.PageRouteInfo<SessionExecutionRouteArgs> {
  SessionExecutionRoute({
    _i4.Key? key,
    required _i5.SessionDto session,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          SessionExecutionRoute.name,
          args: SessionExecutionRouteArgs(
            key: key,
            session: session,
          ),
          initialChildren: children,
        );

  static const String name = 'SessionExecutionRoute';

  static const _i3.PageInfo<SessionExecutionRouteArgs> page =
      _i3.PageInfo<SessionExecutionRouteArgs>(name);
}

class SessionExecutionRouteArgs {
  const SessionExecutionRouteArgs({
    this.key,
    required this.session,
  });

  final _i4.Key? key;

  final _i5.SessionDto session;

  @override
  String toString() {
    return 'SessionExecutionRouteArgs{key: $key, session: $session}';
  }
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
