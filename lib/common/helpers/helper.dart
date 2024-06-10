import 'dart:ui';

import 'package:workout_genius/common/common_dtos/session/session_dto.dart';

import '../utils/utils.dart';

class Helper {
  //methods only specific to this app which are commonly used through out the app

  static Duration calculateTotalDurationOfTheSession(SessionDto session) {
    Duration duration = Duration.zero;

    for (var element in session.sessionExercises!) {
      if (element is BreakDto) {
        duration += element.breakTotalDuration;
      } else if (element is ExerciseDto) {
        for (var e in element.items) {
          if (e is BreakDto) {
            duration += e.breakTotalDuration;
          } else if (e is SetDto) {
            duration += e.setTotalDuration;
          }
        }
      }
    }

    return duration;
  }

  static Color getLightRandomColor(){
    return Utils.getColorFromRandom([
      Color(0xffACDDDE),
      Color(0xffE1F8DC),
      Color(0xffFFE7C7),
      Color(0xffFEF8DD),
      Color(0xffffefef),
      Color(0xffffefde),
      Color(0xffebfde5),
    ]);
  }


}
