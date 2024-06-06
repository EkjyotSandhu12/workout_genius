
import 'dart:developer';

import 'package:flutter/material.dart';

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
    required this.sessionDto,required this.onTap,
  });

  final SessionDto sessionDto;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Duration duration =
    Helper.calculateTotalDurationOfTheSession(sessionDto);

    return ClickableContainer(
      color: AppColors().getTileBackgroundColor,
      borderRadius: BorderRadius.circular(26),
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
                    sessionDto.sessionName,
                    maxLines: 2,
                    style: TextStyles().getHeading18Bold,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    Utils.formatDurationToHHHHMMMSSS(duration),
                    style: TextStyles().getBody14Normal,
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 130,
            height: 130,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26)),
            child: NetworkImageWidget(sessionDto.imageUrl!),
          ),
        ],
      ),
    );
  }
}
