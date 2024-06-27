part of 'create_session_bloc.dart';

sealed class CreateSessionState {}

final class CreateSessionInitialState extends CreateSessionState {}

final class CreateSessionSuccessState extends CreateSessionState {}

final class SessionAddedExerciseState extends CreateSessionState {}
