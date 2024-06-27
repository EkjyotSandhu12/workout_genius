part of 'add_exercise_bloc.dart';

@immutable
sealed class AddExerciseEvent {}

final class TotalSetsUpdatedEvent extends AddExerciseEvent {
  TotalSetsUpdatedEvent({required this.updatedTotalSets});

  late int updatedTotalSets;
}

final class SetsDurationChangedEvent extends AddExerciseEvent {
  SetsDurationChangedEvent({required this.setsDuration});
  late Duration setsDuration;
}

final class BreakDurationChangedEvent extends AddExerciseEvent {
  BreakDurationChangedEvent({required this.breakDuration});
  late Duration breakDuration;
}



final class OnExercisesCreatedEvent extends AddExerciseEvent {

  OnExercisesCreatedEvent({required this.sessionBeingCreated});
  SessionDto sessionBeingCreated;
  
}
