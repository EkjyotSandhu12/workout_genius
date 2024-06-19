abstract class WorkoutItem {} //breakdto and setdto will be considered as workout item as they will come together in a single exercise which is exerciseDto

abstract class SessionItem {} //breakdto and exercisedto will be considered session item as they will come in sessiondto

class SessionDto {
  int elapsedMillisecond;
  String? sessionName;
  String? imageUrl;
  List<SessionItem>? sessionExercises;

  SessionDto({
     this.sessionName,
     this.sessionExercises,
    this.imageUrl,
    this.elapsedMillisecond = 0,
  });
}

class ExerciseDto implements SessionItem {
  late String exerciseName;
  late List<WorkoutItem> items;
  late int totalSets;

  ExerciseDto({
    required this.exerciseName,
    required this.items,
    required this.totalSets,
  });
}

class SetDto implements WorkoutItem {
  late String parentWorkoutName;
  late int reps;
  late int setNo;
  late int totalSets;
  late Duration setTotalDuration;
  Duration elapsedDuration = Duration.zero;

  SetDto({
    required this.setTotalDuration,
    required this.reps,
    required this.setNo,
    required this.totalSets,
    required this.parentWorkoutName,
  });
}

class BreakDto implements WorkoutItem, SessionItem {
  late Duration breakTotalDuration;
  Duration elapsedDuration = Duration.zero;

  BreakDto({required this.breakTotalDuration});
}

List<SessionDto> sessions = [
  SessionDto(
    sessionName: 'Morning workout session',
    imageUrl: '',
    sessionExercises: [
      ExerciseDto(
        totalSets: 4,
        exerciseName: 'exerciseName',
        items: [

          SetDto(
            reps: 12,
            setNo: 1,
            totalSets: 4,
            setTotalDuration: const Duration(seconds: 100),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(
              breakTotalDuration:
              const Duration(seconds: 60)),
          SetDto(
            reps: 12,
            setNo: 1,
            totalSets: 4,
            setTotalDuration: const Duration(seconds: 100),
            parentWorkoutName: 'exerciseName',
          ),
          BreakDto(
              breakTotalDuration:
              const Duration(seconds: 60)),
          SetDto(
            reps: 12,
            setNo: 1,
            totalSets: 4,
            setTotalDuration: const Duration(seconds: 100),
            parentWorkoutName: 'exerciseName',
          ),

        ],
      ),
      BreakDto(
        breakTotalDuration: const Duration(hours: 24, seconds: 60, minutes: 60),
      ),
      ExerciseDto(
        totalSets: 4,
        exerciseName: 'exerciseName',
        items: [
          BreakDto(
              breakTotalDuration:
              const Duration(hours: 24, seconds: 60, minutes: 60)),
          SetDto(
            reps: 12,
            setNo: 1,
            totalSets: 4,
            setTotalDuration: const Duration(seconds: 100),
            parentWorkoutName: 'exerciseName',
          ),
        ],
      ),
      BreakDto(
        breakTotalDuration: const Duration(hours: 24, seconds: 60, minutes: 60),
      ),
      ExerciseDto(
        totalSets: 4,
        exerciseName: 'exerciseName',
        items: [
          BreakDto(
              breakTotalDuration:
              const Duration(hours: 24, seconds: 60, minutes: 60)),
          SetDto(
            reps: 12,
            setNo: 1,
            totalSets: 4,
            setTotalDuration: const Duration(seconds: 100),
            parentWorkoutName: 'exerciseName',
          ),
        ],
      ),
    ],
  ),
];
