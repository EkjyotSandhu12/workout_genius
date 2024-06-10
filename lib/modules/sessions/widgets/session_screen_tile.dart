import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:workout_genius/common/theme/design_metrics.dart';
import 'package:workout_genius/common/theme/theme_decorations.dart';
import 'package:workout_genius/modules/session_exection/widgets/stop_watch_ui.dart';

import '../../../common/common_dtos/session/session_dto.dart';
import '../../../common/components/custom_widgets/clickable_container.dart';
import '../../../common/components/custom_widgets/image_widgets.dart';
import '../../../common/helpers/helper.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_styles.dart';
import '../../../common/utils/utils.dart';

class SessionScreenTileUI extends StatelessWidget {
  const SessionScreenTileUI({
    super.key,
    required this.sessionDto,
    required this.onTap,
  });

  final SessionDto sessionDto;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Duration totalDuration =
        Helper.calculateTotalDurationOfTheSession(sessionDto);

    return ClickableContainer(
      color: AppColors().getPrimaryColor,
      borderRadius: BorderRadius.circular(DesignMetrics().getCommonRadius14),
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sessionDto.sessionName!,
                    maxLines: 2,
                    style: TextStyles().getRubikTextStyle(
                      fontWeight: VFontWeight.w600,
                      fontSize: 18,
                      color: AppColors().getOnPrimaryColor
                    ),
                  ),

                  Text(
                    Utils.formatDurationToHHHHMMMSSS(totalDuration),
                    style: TextStyles().getRubikTextStyle(
                        fontWeight: VFontWeight.normal,
                      fontSize: 14,
                        color: AppColors().getOnPrimaryColor
                    ),
                  )
                ],
              ),
            ),
          ),
          /*     Container(
            width: 130,
            height: 130,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26)),
            child: NetworkImageWidget(sessionDto.imageUrl!),
          ),*/
        ],
      ),
    );
  }
}
