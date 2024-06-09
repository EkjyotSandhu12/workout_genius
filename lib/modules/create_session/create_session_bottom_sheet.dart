import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_genius/common/app_values/app_strings.dart';
import 'package:workout_genius/common/common_dtos/session/session_dto.dart';
import 'package:workout_genius/common/components/custom_widgets/DotsVertical.dart';
import 'package:workout_genius/common/components/custom_widgets/clickable_widget_overlay.dart';
import 'package:workout_genius/common/theme/app_colors.dart';
import 'package:workout_genius/common/theme/design_metrics.dart';
import 'package:workout_genius/common/theme/text_styles.dart';
import 'package:workout_genius/common/utils/screen_utils.dart';
import 'package:workout_genius/common/utils/utils.dart';
import 'package:workout_genius/modules/create_session/widget/add_button.dart';
import 'package:workout_genius/modules/create_session/widget/session_item_break_container.dart';
import 'package:workout_genius/modules/create_session/widget/session_item_exercise_container.dart';
import 'package:workout_genius/modules/session_exection/widgets/stop_watch_ui.dart';

import 'widget/enter_session_name_view.dart';

class CreateSessionBottomSheet extends StatefulWidget {
  CreateSessionBottomSheet({super.key});

  @override
  State<CreateSessionBottomSheet> createState() =>
      _CreateSessionBottomSheetState();
}

class _CreateSessionBottomSheetState extends State<CreateSessionBottomSheet> {
  TextEditingController sessionNameController = TextEditingController(
      text: 'Session ${DateFormat('dd-MMMM-hh:mm'
          '').format(DateTime.now())}');

  SessionDto sessionDto = sessions.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EnterSessionNameUI(
              sessionNameController: sessionNameController,
            ),
            SizedBox(
              height: DesignMetrics().getPageMargin,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: DesignMetrics().getPageMargin),
              child: Column(
                children: [
                  ...sessionDto.sessionExercises.map(
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
                          if (sessionDto.sessionExercises.last != sessionItem)
                            DotsVertical(
                              count: 1,
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DotsVertical(),
            ),
            const AddButton(),
          ],
        ),
      ),
    );
  }
}
