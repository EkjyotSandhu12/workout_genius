import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_genius/common/common_dtos/session/session_dto.dart';
import '../session_execution_helper.dart';

part 'session_execution_event.dart';

part 'session_execution_state.dart';

class SessionExecutionBloc
    extends Bloc<SessionExecutionEvent, SessionExecutionState> {

  //Data Access Variables
  SessionExecutionHelper sessionExecutionHelper = SessionExecutionHelper();

  //State Variables
  late Timer sessionExecutionTimer;
  int timerRefreshTimeMs = 100;
  final SessionDto sessionDto;

  SessionExecutionBloc(this.sessionDto) : super(SessionExecutionInitial()) {
    on<SessionExecutionResumeClicked>(_sessionExecutionResumeClicked);
    on<SessionExecutionPauseClicked>(_sessionExecutionPauseClicked);
    on<SessionExecutionStateUpdated>(_sessionExecutionStateUpdated);
  }

  FutureOr<void> _sessionExecutionStateUpdated(event, emit) {
    sessionExecutionHelper.updateCompletionOfTheSession(sessionDto);
    emit(SessionExecutionInProgress());
  }
  FutureOr<void> _sessionExecutionPauseClicked(event, emit) {
    sessionExecutionTimer.cancel();
    emit(SessionExecutionPause());
  }
  FutureOr<void> _sessionExecutionResumeClicked(event, emit) {
    sessionExecutionTimer = Timer.periodic(
      Duration(milliseconds: timerRefreshTimeMs),
      (timer) {
        sessionDto.elapsedMillisecond += timerRefreshTimeMs;
        add(SessionExecutionStateUpdated());
      },
    );
  }
}
