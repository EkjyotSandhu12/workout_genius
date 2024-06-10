import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/common_dtos/session/session_dto.dart';

part 'create_session_event.dart';

part 'create_session_state.dart';

class CreateSessionBloc extends Bloc<CreateSessionEvent, CreateSessionState> {

  SessionDto sessionDto = SessionDto();

  CreateSessionBloc() : super(CreateSessionInitial()) {

    on<CreateSessionEvent>((event, emit) {
      
    });

  }

}
