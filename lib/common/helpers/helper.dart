import 'package:workout_genius/common/common_dtos/session/session_dto.dart';

class Helper {
  //methods only specific to this app which are commonly used through out the app

  static Duration calculateTotalDurationOfTheSession(SessionDto session) {
    Duration duration = Duration.zero;

    for (var element in session.sessionExercises) {
      if (element is BreakDto) {
        duration += element.breakDuration;
      } else if (element is ExerciseDto) {
        for (var e in element.workouts) {
          if (e is BreakDto) {
            duration += e.breakDuration;
          } else if (e is SetDto) {
            duration += e.setDuration;
          }
        }
      }
    }

    return duration;
  }
}
