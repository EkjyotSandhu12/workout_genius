import 'package:flutter/material.dart';
import 'package:workout_genius/modules/create_session/widget/session_item_break_container.dart';
import 'package:workout_genius/modules/create_session/widget/session_item_circle_ui.dart';
import 'package:workout_genius/modules/create_session/widget/session_item_description_ui.dart';
import '../../../common/common_dtos/session/session_dto.dart';
import '../../../common/theme/design_metrics.dart';
import '../../../common/theme/text_styles.dart';
import '../../../common/utils/utils.dart';



class SessionItemExerciseContainer extends StatelessWidget {
  const SessionItemExerciseContainer({
    super.key,
    required this.exerciseDto,
  });

  final ExerciseDto exerciseDto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 8,
        left: 12,
        right: 12,
        bottom: 12,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DesignMetrics().getCommonRadius24),
        color: Colors.grey.withOpacity(.2),
      ),
      child: Column(
        children: [
          ExercisePreviewHeader(
            exerciseDto: exerciseDto,
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            children: [
              ...exerciseDto.items.map(
                    (workoutItem) {
                  if (workoutItem is SetDto) {
                    return Row(
                      children: [
                        SessionItemCircleUI(
                          centerText:
                          'Set ${workoutItem.setNo} of ${workoutItem.totalSets}',
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SessionItemDescription(
                          text: 'Set Duration ',
                          value: Utils.formatDurationToHMS(
                              workoutItem.setTotalDuration),
                        )
                      ],
                    );
                  } else if (workoutItem is BreakDto) {
                    return SessionItemBreakListTile(
                      breakDto: workoutItem,
                    );
                  }

                  return SizedBox();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExercisePreviewHeader extends StatelessWidget {
  const ExercisePreviewHeader({
    super.key,
    required this.exerciseDto,
  });

  final ExerciseDto exerciseDto;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            exerciseDto.exerciseName,
            style: TextStyles()
                .getRubikTextStyle(fontSize: 16, fontWeight: VFontWeight.w500),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 1,
            ),
            Text('Total Exercise Duration  ',
                style: TextStyles().getRubikTextStyle(
                    fontSize: 12, fontWeight: VFontWeight.w300)),
            Text(
              '1h 24m 33s',
              style: TextStyles().getRubikTextStyle(
                  fontSize: 12, fontWeight: VFontWeight.normal),
            ),
          ],
        ),
      ],
    );
  }
}

