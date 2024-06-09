import 'package:flutter/material.dart';

import '../../../common/components/custom_widgets/rounded_circular_progress_indicator.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_styles.dart';
import '../../../common/theme/theme_decorations.dart';
import '../../../common/utils/utils.dart';

class StopWatchUI extends StatelessWidget {
  const StopWatchUI({
    super.key,
    required this.elapsedTime,
    required this.totalSetTime,
  });

  final Duration elapsedTime;
  final Duration totalSetTime;

  @override
  Widget build(BuildContext context) {
    Duration d = (totalSetTime - elapsedTime);

    String? hour = Utils.formatDurationToHH(d);
    String? minutes = Utils.formatDurationToMM(d);
    String seconds = Utils.formatDurationTo60S(d);
    String millisecond = Utils.formatDurationToms(d);

    List<Map> timeValues = [
      if (hour != null) {'number': hour, 'type': 'Hour'},
      if (minutes != null) {'number': minutes, 'type': 'Minute'},
      {'number': '$seconds', 'number2': millisecond, 'type': 'Second'},
    ];

    return Container(
      alignment: Alignment.center,
      height: 260,
      width: 260,
      decoration: BoxDecoration(
          color: AppColors().getPrimaryShade1Color,
          shape: BoxShape.circle,
          boxShadow: [ThemeDecorations().commonContainerBoxShadow()]),
      child: RoundedCircularProgressIndicator(
        centerWidget: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...timeValues.map(
              (e) {
                return Container(
                  width: 64,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${e['number']}',
                            style: TextStyles().getAboretoTextStyle(
                              fontSize: 36,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                              color: AppColors().getTextColor,
                            ),
                          ),
                          if (e['number2'] != null)
                            SizedBox(
                              width: 14,
                              child: Text(
                                '${e['number2']}',
                                style: TextStyles().getAboretoTextStyle(
                                  fontSize: 16,
                                  height: 2,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors().getTextColor,
                                ),
                              ),
                            ),
                        ],
                      ),
                      Text(
                        '${e['type']}',
                        style: TextStyles().getAboretoTextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors().getTextColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        strokeWidth: 24,
        strokeColor: AppColors().getSecondaryColor.withOpacity(.5),
        value: Utils.calculateRatio(
            totalSetTime.inMilliseconds, elapsedTime.inMilliseconds),
      ),
    );
  }
}
