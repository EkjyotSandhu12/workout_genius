import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../common/common_dtos/session/session_dto.dart';

part 'add_exercise_event.dart';

part 'add_exercise_state.dart';

class AddExerciseBloc extends Bloc<AddExerciseEvent, AddExerciseState> {
  ///==> Variables states
  List<SetDto> setsList = [
    getSetObject(1)
  ]; //this variable will contain all the sets that user have added.
  Duration breakDuration = const Duration(
      seconds: 45); //this variable will contain breaks between each set.

  ///==> EVENTS
  AddExerciseBloc() : super(AddExerciseInitialState()) {
    on<OnExercisesCreatedEvent>(onExerciseCreated);
    on<BreakDurationChangedEvent>(onBreakDurationChanged);
    on<SetsDurationChangedEvent>(onSetsDurationChanged);
    on<TotalSetsUpdatedEvent>(onTotalSetsUpdated);
  }

  FutureOr<void> onExerciseCreated(OnExercisesCreatedEvent event, emit) {
    SessionDto sessionDto = event.sessionBeingCreated;
    ExerciseDto exerciseDto = ExerciseDto(
        exerciseName: 'exerciseName',
        items: ([
          ...setsList.expand(
              (set) => [set, BreakDto(breakTotalDuration: breakDuration)]),
        ])
          ..removeLast(),
        totalSets: setsList.length);

    sessionDto.sessionExercises ??= [];
    sessionDto.sessionExercises?.add(exerciseDto);
    emit(AddExerciseSuccessState());
  }

  FutureOr<void> onBreakDurationChanged(BreakDurationChangedEvent event, emit) {
    breakDuration = event.breakDuration;
  }


  FutureOr<void> onSetsDurationChanged(SetsDurationChangedEvent event, emit) {
    setsList.forEach((set) {
      set.setTotalDuration = event.setsDuration;
    });
    emit(AddExerciseInitialState());
  }
  
  
  FutureOr<void> onTotalSetsUpdated(TotalSetsUpdatedEvent event, emit) {
    if (event.updatedTotalSets > setsList.length) {
      setsList.add(getSetObject(event.updatedTotalSets));
    }
    emit(AddExerciseInitialState());
  }



  ///==> Utilities
  static getSetObject(int setNo) {
    return SetDto(
      setTotalDuration: const Duration(seconds: 45),
      reps: 12,
      setNo: setNo,
    );
  }

}
