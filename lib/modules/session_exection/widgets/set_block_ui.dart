import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_genius/modules/session_exection/widgets/stop_watch_ui.dart';

import '../../../common/components/custom_widgets/rounded_circular_progress_indicator.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_styles.dart';
import '../../../common/utils/utils.dart';

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StopWatchUI(
          elapsedTime: elapsedTime,
          totalSetTime: totalSetTime,
        ),
        const SizedBox(
          width: 24,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              parentWorkoutName,
              style: TextStyles().getAboretoTextStyle(
                  color: AppColors().getTextColor,
                  fontSize: 18,fontWeight: FontWeight.bold),
            ),
            Text(
              'Set $setNo of $totalSets',
              style: TextStyles().getAboretoTextStyle(
                color: AppColors().getTextColor,
                fontSize: 14,),
            ),
          ],
        )
      ],
    );
  }
}

