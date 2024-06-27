part of 'add_exercise_bloc.dart';

@immutable
sealed class AddExerciseState {}

final class AddExerciseInitialState extends AddExerciseState {}

final class AddExerciseSuccessState extends AddExerciseState {}
