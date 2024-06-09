import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_genius/common/components/custom_widgets/clickable_widget_overlay.dart';
import 'package:workout_genius/common/route/route_service.dart';
import 'package:workout_genius/common/theme/design_metrics.dart';
import 'package:workout_genius/common/theme/text_styles.dart';
import 'package:workout_genius/modules/create_session/create_session_bottom_sheet_ui.dart';
import 'package:workout_genius/modules/sessions/widgets/session_screen_tile.dart';
import '../../common/common_dtos/session/session_dto.dart';
import '../../common/theme/app_colors.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      extendBody: true,


      floatingActionButton: CreateSessionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text('Your workout sessions'),
      ),
      body: ListView(
        padding:
            EdgeInsets.symmetric(horizontal: DesignMetrics().getPageMargin),
        children: [
          ...sessions.map(
            (SessionDto session) {
              return Padding(
                padding: EdgeInsets.only(bottom: DesignMetrics().getPageMargin),
                child: SessionScreenTileUI(
                  sessionDto: session,
                  onTap: () {
                    RouteService().sessionExecutionScreenNavigate(session);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CreateSessionButton extends StatelessWidget {
  const CreateSessionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClickableWidgetOverlay(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          enableDrag: false,
          isScrollControlled: true,
          builder: (context) {
            return const CreateSessionBottomSheetUI();
          },
        );
      },
      widget: Container(
        alignment: Alignment.center,
        height: 50,
        width: 170,
        decoration: BoxDecoration(
          color: AppColors().getPrimaryColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Text(
          'Create Session',
          style: TextStyles().getRubikTextStyle(
            fontSize: 17,
            fontWeight: VFontWeight.w500,
            color: AppColors().getOnPrimaryColor,
          ),
        ),
      ),
    );
  }
}
