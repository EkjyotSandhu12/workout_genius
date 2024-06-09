import 'package:flutter/material.dart';
import 'package:workout_genius/modules/session_exection/widgets/stop_watch_ui.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_styles.dart';

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StopWatchUI(
          elapsedTime: elapsedTime,
          totalSetTime: totalBreakTime,
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          'Break',
          style: TextStyles().getAboretoTextStyle(
            fontSize: 18,
            color: AppColors().getTextColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
