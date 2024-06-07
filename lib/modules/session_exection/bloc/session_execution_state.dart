part of 'session_execution_bloc.dart';

sealed class SessionExecutionState {}

final class SessionExecutionInitial extends SessionExecutionState {}
final class SessionExecutionInProgress extends SessionExecutionState {}
final class SessionExecutionCompleted extends SessionExecutionState {}
final class SessionExecutionPause extends SessionExecutionState {}
