part of 'session_execution_bloc.dart';

sealed class SessionExecutionEvent {}

class SessionExecutionStarted extends SessionExecutionEvent{

}

class SessionExecutionResumed extends SessionExecutionEvent{}
class SessionExecutionPaused extends SessionExecutionEvent{}
