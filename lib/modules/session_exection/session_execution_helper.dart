import '../../common/common_dtos/session/session_dto.dart';

class SessionExecutionHelper {
  updateCompletionOfTheSession(SessionDto session) {
    int sessionElapsedMs = session.elapsedMillisecond.toInt();
    // int sessionElapsedMs = 420000;
    for (var sessionItem in session.sessionExercises) {
      if (sessionItem is ExerciseDto) {
        if (sessionElapsedMs == 0) {
          break;
        }
        for (var workoutItem in sessionItem.workouts) {
          bool isSet = workoutItem is SetDto;
          bool isBreak = workoutItem is BreakDto;

          if (isSet) {
            int setInMs = workoutItem.setTotalDuration.inMilliseconds;
            if (workoutItem.setTotalDuration == workoutItem.elapsedDuration) {
              sessionElapsedMs -= setInMs;
            } else {
              if (setInMs > sessionElapsedMs) {
                workoutItem.elapsedDuration =
                    Duration(milliseconds: sessionElapsedMs);
                sessionElapsedMs = 0;
                break;
              } else {
                sessionElapsedMs -= setInMs;
                workoutItem.elapsedDuration = Duration(milliseconds: setInMs);
              }
            }
          }

          if (isBreak) {
            int breakInMs = workoutItem.breakTotalDuration.inMilliseconds;
            if (workoutItem.breakTotalDuration == workoutItem.elapsedDuration) {
              sessionElapsedMs -= breakInMs;
            } else {
              if (breakInMs > sessionElapsedMs) {
                workoutItem.elapsedDuration =
                    Duration(milliseconds: sessionElapsedMs);
                sessionElapsedMs = 0;
                break;
              } else {
                sessionElapsedMs -= breakInMs;
                workoutItem.elapsedDuration = Duration(milliseconds: breakInMs);
              }
            }
          }
        }
      }

      if (sessionItem is BreakDto) {
        int breakInMs = sessionItem.breakTotalDuration.inMilliseconds;
        if (sessionItem.breakTotalDuration == sessionItem.elapsedDuration) {
          sessionElapsedMs -= breakInMs;
        } else {
          if (breakInMs > sessionElapsedMs) {
            sessionItem.elapsedDuration =
                Duration(milliseconds: sessionElapsedMs);
            sessionElapsedMs = 0;
            break;
          } else {
            sessionElapsedMs -= breakInMs;
            sessionItem.elapsedDuration = Duration(milliseconds: breakInMs);
          }
        }
      }
    }
  }
}
