import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_genius/common/components/app_widgets/buttons.dart';
import 'package:workout_genius/modules/session_exection/bloc/session_execution_bloc.dart';
import 'package:workout_genius/modules/session_exection/widgets/break_block_ui.dart';
import 'package:workout_genius/modules/session_exection/widgets/set_block_ui.dart';
import '../../common/common_dtos/session/session_dto.dart';
import '../../common/components/custom_widgets/rounded_circular_progress_indicator.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/text_styles.dart';
import '../../common/utils/utils.dart';

class SessionExecutionScreen extends StatefulWidget {
  const SessionExecutionScreen({super.key, required this.session});

  final SessionDto session;

  @override
  State<SessionExecutionScreen> createState() => _SessionExecutionScreenState();
}

class _SessionExecutionScreenState extends State<SessionExecutionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SessionExecutionBloc(widget.session),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Session Execution'),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BtnElevated(
                onTap: () {
                  context
                      .read<SessionExecutionBloc>()
                      .add(SessionExecutionResumeClicked());
                },
                buttonText: 'Play',
                btnProperties: BtnProperties(
                  size: const Size(100, 50),
                  backgroundColor: Colors.green,
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              BtnElevated(
                onTap: () {
                  context
                      .read<SessionExecutionBloc>()
                      .add(SessionExecutionPauseClicked());
                },
                buttonText: 'Stop',
                btnProperties: BtnProperties(
                  backgroundColor: Colors.red,
                  size: const Size(100, 50),
                ),
              ),
            ],
          ),
          body: BlocBuilder<SessionExecutionBloc, SessionExecutionState>(
            builder: (context, state) {
              return Container(
                alignment: Alignment.center,
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    ...widget.session.sessionExercises!.map(
                      (sessionItem) {
                        bool isExercise = sessionItem is ExerciseDto;
                        bool isBreak = sessionItem is BreakDto;
                        int totalSets = 0;

                        if (isExercise) {
                          totalSets = sessionItem.items.length;
                          return ListView(
                            cacheExtent: 1,
                            shrinkWrap: true,
                            itemExtent: 326,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              ...sessionItem.items.map(
                                (workoutItem) {

                                  bool isSet = workoutItem is SetDto;
                                  bool isBreak = workoutItem is BreakDto;

                                  if (isSet) {
                                    totalSets = sessionItem.items.length;

                                    return SetBlockUI(
                                      setNo: sessionItem.items
                                              .indexOf(workoutItem) +
                                          1,
                                      totalSets: totalSets,
                                      parentWorkoutName:
                                          workoutItem.parentWorkoutName,
                                      elapsedTime: workoutItem.elapsedDuration,
                                      totalSetTime:
                                          workoutItem.setTotalDuration,
                                    );
                                  }
                                  if (isBreak) {
                                    return BreakBlockUI(
                                      elapsedTime: workoutItem.elapsedDuration,
                                      totalBreakTime:
                                          workoutItem.breakTotalDuration,
                                    );
                                  }

                                  return const SizedBox();
                                },
                              ),
                            ],
                          );
                        }

                        if (isBreak) {
                          return BreakBlockUI(
                            elapsedTime: sessionItem.elapsedDuration,
                            totalBreakTime: sessionItem.breakTotalDuration,
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
