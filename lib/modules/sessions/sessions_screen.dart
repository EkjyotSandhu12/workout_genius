import 'package:flutter/material.dart';
import 'package:workout_genius/common/route/route_service.dart';
import 'package:workout_genius/common/theme/design_metrics.dart';
import 'package:workout_genius/modules/sessions/widgets/session_screen_tile.dart';
import '../../common/common_dtos/session/session_dto.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
