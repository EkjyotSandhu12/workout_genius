import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_genius/common/components/app_widgets/buttons.dart';
import 'package:workout_genius/modules/session_exection/bloc/session_execution_bloc.dart';
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
    updateCompletionOfTheSession(widget.session);
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
                      .add(SessionExecutionResumed());
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
                      .add(SessionExecutionPaused());
                },
                buttonText: 'Stop',
                btnProperties: BtnProperties(
                  backgroundColor: Colors.red,
                  size: const Size(100, 50),
                ),
              ),
            ],
          ),
          body: BlocConsumer<SessionExecutionBloc, SessionExecutionState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              return Container(
                alignment: Alignment.center,
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    ...widget.session.sessionExercises.map(
                          (sessionItem) {
                        bool isExercise = sessionItem is ExerciseDto;
                        bool isBreak = sessionItem is BreakDto;
                        int totalSets = 0;

                        if (isExercise) {
                          totalSets = sessionItem.workouts.length;
                          return ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              ...sessionItem.workouts.map(
                                    (workoutItem) {
                                  bool isSet = workoutItem is SetDto;
                                  bool isBreak = workoutItem is BreakDto;

                                  if (isSet) {
                                    totalSets = sessionItem.workouts.length;

                                    return SetBlockUI(
                                      setNo: sessionItem.workouts
                                          .indexOf(workoutItem) +
                                          1,
                                      totalSets: totalSets,
                                      parentWorkoutName:
                                      workoutItem.parentWorkoutName,
                                      elapsedTime: workoutItem.elapsedDuration,
                                      totalSetTime: workoutItem
                                          .setTotalDuration,
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

updateCompletionOfTheSession(SessionDto session) {
  int sessionElapsedMs = session.elapsedMillisecond.toInt();
  // int sessionElapsedMs = 420000;

  session.sessionExercises.forEach(
        (sessionItem) {
      if (sessionItem is ExerciseDto) {
        sessionItem.workouts.forEach(
              (workoutItem) {
            bool isSet = workoutItem is SetDto;
            bool isBreak = workoutItem is BreakDto;

            if (isSet) {
              int setInMs = workoutItem.setTotalDuration.inMilliseconds;
              if (setInMs > sessionElapsedMs) {
                workoutItem.elapsedDuration =
                    Duration(milliseconds: sessionElapsedMs);
                sessionElapsedMs = 0;
              } else {
                sessionElapsedMs -= setInMs;
                workoutItem.elapsedDuration = Duration(milliseconds: setInMs);
              }
            }

            if (isBreak) {
              int breakInMs = workoutItem.breakTotalDuration.inMilliseconds;
              if (breakInMs > sessionElapsedMs) {
                workoutItem.elapsedDuration =
                    Duration(milliseconds: sessionElapsedMs);
                sessionElapsedMs = 0;
              } else {
                sessionElapsedMs -= breakInMs;
                workoutItem.elapsedDuration = Duration(milliseconds: breakInMs);
              }
            }
          },
        );
      }

      if (sessionItem is BreakDto) {
        int breakInMs = sessionItem.breakTotalDuration.inMilliseconds;
        if (breakInMs > sessionElapsedMs) {
          sessionItem.elapsedDuration =
              Duration(milliseconds: sessionElapsedMs);
          sessionElapsedMs = 0;
        } else {
          sessionElapsedMs -= breakInMs;
          sessionItem.elapsedDuration = Duration(milliseconds: breakInMs);
        }
      }
    },
  );
}

class SetBlockUI extends StatelessWidget {
  const SetBlockUI({
    super.key,
    required this.parentWorkoutName,
    required this.elapsedTime,
    required this.totalSetTime,
    required this.totalSets,
    required this.setNo,
  });

  final String parentWorkoutName;
  final Duration elapsedTime;
  final Duration totalSetTime;
  final int totalSets;
  final int setNo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(11),
          height: 140,
          width: 140,
          child: RoundedCircularProgressIndicator(
            centerWidget: Text(
              '${(totalSetTime - elapsedTime).inMilliseconds}',
              style: TextStyles().getHeading18Bold,
            ),
            backgroundColor: Colors.grey,
            strokeWidth: 20,
            strokeColor: AppColors().getPrimaryColor,
            value: Utils.calculateRatio(
                totalSetTime.inMilliseconds, elapsedTime.inMilliseconds),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              parentWorkoutName,
              style: TextStyles().getHeading18Bold,
            ),
            Text(
              'Set $setNo of $totalSets',
              style: TextStyles().getBody14Normal,
            ),
          ],
        )
      ],
    );
  }
}

class BreakBlockUI extends StatelessWidget {
  const BreakBlockUI({
    super.key,
    required this.elapsedTime,
    required this.totalBreakTime,
  });

  final Duration elapsedTime;
  final Duration totalBreakTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(11),
          height: 140,
          width: 140,
          child: RoundedCircularProgressIndicator(
            centerWidget: Text(
              '${(totalBreakTime - elapsedTime).inMilliseconds}',
              style: TextStyles().getHeading18Bold,
            ),
            backgroundColor: Colors.grey,
            strokeWidth: 20,
            strokeColor: AppColors().getPrimaryColor,
            value: Utils.calculateRatio(
                totalBreakTime.inMilliseconds, elapsedTime.inMilliseconds),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          'Break',
          style: TextStyles().getHeading18Bold,
        )
      ],
    );
  }
}
