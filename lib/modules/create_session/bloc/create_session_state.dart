part of 'create_session_bloc.dart';

sealed class CreateSessionState {}

final class CreateSessionInitial extends CreateSessionState {}

final class CreateSessionSuccess extends CreateSessionState {}
