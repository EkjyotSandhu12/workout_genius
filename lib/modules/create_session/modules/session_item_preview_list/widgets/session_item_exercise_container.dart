import 'package:flutter/material.dart';
import 'package:workout_genius/modules/create_session/modules/session_item_preview_list/widgets/session_item_break_container.dart';
import 'package:workout_genius/modules/create_session/modules/session_item_preview_list/widgets/session_item_description_ui.dart';
import 'package:workout_genius/modules/create_session/modules/session_item_preview_list/widgets/session_item_circle_ui.dart';
import '../../../../../common/common_dtos/session/session_dto.dart';
import '../../../../../common/theme/design_metrics.dart';
import '../../../../../common/theme/text_styles.dart';
import '../../../../../common/theme/theme_decorations.dart';
import '../../../../../common/utils/utils.dart';

class SessionItemExerciseContainer extends StatefulWidget {
  const SessionItemExerciseContainer({
    super.key,
    required this.exerciseDto,
  });

  final ExerciseDto exerciseDto;

  @override
  State<SessionItemExerciseContainer> createState() => _SessionItemExerciseContainerState();
}

class _SessionItemExerciseContainerState extends State<SessionItemExerciseContainer> {

  Color containerColor =  Color(0xfffff5ee);


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
        boxShadow: [
          ThemeDecorations().commonWorkoutPreviewBoxShadow(),
        ],
        borderRadius: BorderRadius.circular(DesignMetrics().getCommonRadius24),
        color: containerColor,
      ),
      child: Column(
        children: [
          ExercisePreviewHeader(
            exerciseDto: widget.exerciseDto,
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            children: [
              ...widget.exerciseDto.items.map(
                (workoutItem) {
                  Widget child = const SizedBox();

                  if (workoutItem is SetDto) {
                    child = Row(
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
                    child = SessionItemBreakListTile(
                      breakDto: workoutItem,
                    );
                  }

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: child,
                  );
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
