import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../common/common_dtos/session/session_dto.dart';

part 'add_exercise_event.dart';
part 'add_exercise_state.dart';

class AddExerciseBloc extends Bloc<AddExerciseEvent, AddExerciseState> {


  ///==> Variables states
  List<SetDto> setsList = [getSetObject(1)];


  ///==> EVENTS
  AddExerciseBloc() : super(AddExerciseInitial()) {
    on<TotalSetsUpdated>(onTotalSetsUpdated);
    on<SetsDurationChanged>(onAddExerciseEvent);
  }

  FutureOr<void> onTotalSetsUpdated(TotalSetsUpdated event, emit){
    if (event.updatedTotalSets > setsList.length) {
      setsList.add(getSetObject(event.updatedTotalSets));
    }
    emit(AddExerciseInitial());
  }

  FutureOr<void> onAddExerciseEvent(SetsDurationChanged event, emit) {
    setsList.forEach((set) {
      set.setTotalDuration = event.setsDuration;
    });
    emit(AddExerciseInitial());
  }


  ///==> Utilities
  static getSetObject(int setNo){
    return  SetDto(
      setTotalDuration: const Duration(seconds: 45),
      reps: 12,
      setNo: setNo,);
  }


}
