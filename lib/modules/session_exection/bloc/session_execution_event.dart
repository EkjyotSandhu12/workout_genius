part of 'session_execution_bloc.dart';

sealed class SessionExecutionEvent {}

class SessionExecutionResumeClicked extends SessionExecutionEvent{}
class SessionExecutionStateUpdated extends SessionExecutionEvent{}
class SessionExecutionPauseClicked extends SessionExecutionEvent{}
