import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'session_execution_event.dart';

part 'session_execution_state.dart';

class SessionExecutionBloc
    extends Bloc<SessionExecutionEvent, SessionExecutionState> {
  StreamSubscription? _timerSubscription;

  SessionExecutionBloc() : super(SessionExecutionInitial()) {
    on<SessionExecutionStarted>((event, emit) {

      log('computationCount');

      Stream.periodic(
        Duration(milliseconds: 500),
        (computationCount) {
          log('computationCount ${computationCount}');

        },
      );


    });
  }
}
