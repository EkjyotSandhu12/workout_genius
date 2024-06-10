import 'package:workout_genius/modules/create_session/modules/session_item_preview_list/widgets/session_item_break_container.dart';
import '../../../../common/common_dtos/session/session_dto.dart';
import 'package:flutter/material.dart';
import '../../../../common/components/custom_widgets/DotsVertical.dart';
import 'widgets/session_item_exercise_container.dart';

class SessionItemsPreviewList extends StatelessWidget {
  const SessionItemsPreviewList({
    super.key,
    required this.sessionDto,
  });

  final SessionDto sessionDto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...?sessionDto.sessionExercises?.map(
              (sessionItem) {
            Widget child = const SizedBox();

            if (sessionItem is BreakDto) {
              child = SessionItemBreakContainer(
                breakDto: sessionItem,
              );
            }
            if (sessionItem is ExerciseDto) {
              child = SessionItemExerciseContainer(
                exerciseDto: sessionItem,
              );
            }
            return Column(
              children: [
                child,
                if (sessionDto.sessionExercises?.last != sessionItem)
                  DotsVertical(
                    count: 1,
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
