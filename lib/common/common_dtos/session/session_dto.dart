class SessionDto {
  String sessionName;
  String? imageUrl;
  List<SessionItem> sessionExercises;

  SessionDto({
    required this.sessionName,
    required this.sessionExercises,
    this.imageUrl,
  });
}

class ExerciseDto implements SessionItem {
  late String exerciseName;
  late List<WorkoutItem> workouts;

  ExerciseDto({required this.exerciseName, required this.workouts});
}

class SetDto implements WorkoutItem {
  late int reps;
  late Duration setDuration;

  SetDto({required this.reps, required this.setDuration});
}

class BreakDto implements WorkoutItem, SessionItem {
  late Duration breakDuration;

  BreakDto({required this.breakDuration});
}

abstract class WorkoutItem {}

abstract class SessionItem {}

List<SessionDto> sessions = [
  SessionDto(
      sessionExercises: [
        ExerciseDto(exerciseName: 'exerciseName', workouts: [
          SetDto(reps: 12, setDuration: const Duration(seconds: 12)),
          BreakDto(breakDuration: const Duration(seconds: 12)),
        ])
      ],
      sessionName: 'Morning workout session',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/c/c4/Official_Photograph_of_Prime_Minister_Narendra_Modi_Portrait.png'),
];
