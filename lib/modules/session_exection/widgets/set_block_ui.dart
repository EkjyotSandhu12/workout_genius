import 'package:flutter/material.dart';

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