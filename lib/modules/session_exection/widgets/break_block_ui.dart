import 'package:flutter/material.dart';

import '../../../common/components/custom_widgets/rounded_circular_progress_indicator.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_styles.dart';
import '../../../common/utils/utils.dart';

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
