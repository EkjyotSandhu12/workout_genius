import 'package:flutter/material.dart';
import 'package:workout_genius/common/theme/theme_decorations.dart';
import 'package:workout_genius/modules/create_session/modules/session_item_preview_list/widgets/session_item_circle_ui.dart';
import 'package:workout_genius/modules/create_session/modules/session_item_preview_list/widgets/session_item_description_ui.dart';
import '../../../../../common/common_dtos/session/session_dto.dart';
import '../../../../../common/theme/design_metrics.dart';
import '../../../../../common/utils/utils.dart';

class SessionItemBreakContainer extends StatefulWidget {
  SessionItemBreakContainer({
    super.key,
    required this.breakDto,
  });

  final BreakDto breakDto;

  @override
  State<SessionItemBreakContainer> createState() =>
      _SessionItemBreakContainerState();
}

class _SessionItemBreakContainerState extends State<SessionItemBreakContainer> {
  Color containerColor =       Color(0xffCAF1DE);
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
      child: SessionItemBreakListTile(
        breakDto: widget.breakDto,
      ),
    );
  }
}

class SessionItemBreakListTile extends StatelessWidget {
  const SessionItemBreakListTile({
    super.key,
    required this.breakDto,
  });

  final BreakDto breakDto;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SessionItemCircleUI(
          size: 60,
          centerText: 'Break',
        ),
        SizedBox(
          width: 8,
        ),
        SessionItemDescription(
          text: 'Break Duration ',
          value: Utils.formatDurationToHMS(breakDto.breakTotalDuration),
        )
      ],
    );
  }
}
