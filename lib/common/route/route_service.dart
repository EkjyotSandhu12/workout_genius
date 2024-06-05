import 'package:workout_genius/common/route/router.dart';

import '../common_dtos/session/session_dto.dart';
import 'router.gr.dart';


class RouteService{
  static final RouteService _singleton = RouteService._internal();
  factory RouteService() => _singleton;
  RouteService._internal();



  pop({data}) {
    return router.pop();
  }

  //==> SCREENS NAVIGATION
  sessionScreenNavigate() async {
  }

  //==> SCREENS NAVIGATION
  sessionExecutionScreenNavigate(SessionDto session) async {
  }


}