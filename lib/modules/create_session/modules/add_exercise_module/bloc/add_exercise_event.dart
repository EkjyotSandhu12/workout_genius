part of 'add_exercise_bloc.dart';

@immutable
sealed class AddExerciseEvent {}

final class TotalSetsUpdated extends AddExerciseEvent {
  TotalSetsUpdated({required this.updatedTotalSets});

  late int updatedTotalSets;
}

final class SetsDurationChanged extends AddExerciseEvent {
  SetsDurationChanged({required this.setsDuration});
  late Duration setsDuration;
}
