/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/components/app_widgets/workout_timeline/workout_timeline_editable_view.dart';
import '../../../../common/dto/session_dtos/session_dto.dart';
import '../../../../common/services/log_service.dart';
import '../../create_workout_session_provider.dart';

class EditOrAddWorkouts extends StatelessWidget {
  const EditOrAddWorkouts({super.key});

  @override
  Widget build(BuildContext context) {
    loggy.traceLog("EditOrAddWorkouts page rebuild occurred");
    SessionCreationProvider sCP = Provider.of<SessionCreationProvider>(context);
    SessionDTO session = sCP.sessionBeingCreated;
    loggy.traceLog("sCP.timelineData ${sCP.timelineData.length}");

    return SafeArea(
      top: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(session.sessionName),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TimelineEditableWidget(
                sCP: sCP,
                timelineData: [...sCP.timelineData],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
