class SessionDto {
  int elapsedMillisecond;
  String sessionName;
  String? imageUrl;
  List<SessionItem> sessionExercises;

  SessionDto({
    required this.sessionName,
    required this.sessionExercises,
    this.imageUrl,
    this.elapsedMillisecond = 0,
  });
}

class ExerciseDto implements SessionItem {
  late String exerciseName;
  late List<WorkoutItem> workouts;

  ExerciseDto({required this.exerciseName, required this.workouts});
}

class SetDto implements WorkoutItem {
  late String parentWorkoutName;
  late int reps;
  late Duration setTotalDuration;
  Duration elapsedDuration = Duration.zero;

  SetDto({
    required this.setTotalDuration,
    required this.reps,
    required this.parentWorkoutName,
  });
}

class BreakDto implements WorkoutItem, SessionItem {
  late Duration breakTotalDuration;
  Duration elapsedDuration = Duration.zero;

  BreakDto({required this.breakTotalDuration});
}

abstract class WorkoutItem {}
abstract class SessionItem {}

List<SessionDto> sessions = [
  SessionDto(
    sessionExercises: [
      ExerciseDto(
        exerciseName: 'exerciseName',
        workouts: [
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
          SetDto(
            reps: 12,
            setTotalDuration: const Duration(seconds: 120),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(breakTotalDuration: const Duration(seconds: 120)),
        ],
      ),
    ],
    sessionName: 'Morning workout session',
    imageUrl: '',
  ),
];
