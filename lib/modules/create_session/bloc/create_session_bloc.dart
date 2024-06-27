import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/common_dtos/session/session_dto.dart';

part 'create_session_state.dart';

class CreateSessionBloc extends Cubit<CreateSessionState> {

  SessionDto sessionInCreation = SessionDto();

  CreateSessionBloc() : super(CreateSessionInitialState());


  createSession(SessionDto sessionDto){
    sessions.add(sessionDto);
    emit(CreateSessionSuccessState());
  }

}
