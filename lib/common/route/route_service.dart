import 'package:workout_genius/common/route/router.dart';

import '../common_dtos/session/session_dto.dart';
import 'router.gr.dart';


class RouteService{
  static final RouteService _singleton = RouteService._internal();
  factory RouteService() => _singleton;
  RouteService._internal();

  maybePop({data}) async {
    return appRouter.popForced(data);
  }

  pop({data}) {
    return appRouter.popForced(data);
  }

  //==> SCREENS NAVIGATION
  sessionScreenNavigate() async {
    return await appRouter.push(const SessionsRoute());
  }

  //==> SCREENS NAVIGATION
  sessionExecutionScreenNavigate(SessionDto session) async {
    return await appRouter.push(SessionExecutionRoute(session:session));
  }


}