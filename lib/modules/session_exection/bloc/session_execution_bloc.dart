import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_genius/common/common_dtos/session/session_dto.dart';

part 'session_execution_event.dart';

part 'session_execution_state.dart';

class SessionExecutionBloc
    extends Bloc<SessionExecutionEvent, SessionExecutionState> {
  late Timer sessionExecutionTimer;
  int timerRefreshTime = 500;

  final SessionDto sessionDto;

  SessionExecutionBloc(this.sessionDto) : super(SessionExecutionInitial()) {

    on<SessionExecutionResumed>((event, emit) {

      log('Called this');

      sessionDto.elapsedMillisecond += timerRefreshTime;
      emit(SessionExecutionInProgress());

/*      sessionExecutionTimer = Timer.periodic(
        Duration(milliseconds: timerRefreshTime),
        (timer) {
          sessionDto.elapsedMillisecond += timerRefreshTime;
          emit(SessionExecutionInProgress());
        },
      );*/


    });

    on<SessionExecutionPaused>((event, emit) {
      sessionExecutionTimer.cancel();
    });

  }
}
