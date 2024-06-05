import 'package:flutter_bloc/flutter_bloc.dart';

part 'session_execution_event.dart';

part 'session_execution_state.dart';

class SessionExecutionBloc
    extends Bloc<SessionExecutionEvent, SessionExecutionState> {
  SessionExecutionBloc() : super(SessionExecutionInitial()) {
    on<SessionExecutionEvent>((event, emit) {});
  }
}
