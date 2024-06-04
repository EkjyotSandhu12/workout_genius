import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:workout_genius/common/theme/app_colors.dart';
import 'package:workout_genius/modules/sessions/widgets/session_screen_tile.dart';
import '../../common/common_dtos/session/session_dto.dart';
import '../../common/components/custom_widgets/clickable_container.dart';

@RoutePage()
class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your workout sessions'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          ...sessions.map(
            (SessionDto session) {
              return ClickableContainer(
                color: AppColors().getTileBackgroundColor,
                borderRadius: BorderRadius.circular(26),
                onTap: () {},
                child: SessionScreenTile(session: session),
              );
            },
          ),
        ],
      ),
    );
  }
}
