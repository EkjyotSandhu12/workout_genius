import 'package:workout_genius/common/route/router.dart';

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

  //==> SCREENS NAVIGATIONS
  customerDetailsSegment1ViewNavigate() async {
    return await appRouter.push(const Module1Route());
  }


}