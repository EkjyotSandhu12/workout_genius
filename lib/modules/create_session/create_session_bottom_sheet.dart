import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_genius/common/app_values/app_strings.dart';
import 'package:workout_genius/common/common_dtos/session/session_dto.dart';
import 'package:workout_genius/common/components/custom_widgets/DotsVertical.dart';
import 'package:workout_genius/common/theme/design_metrics.dart';
import 'package:workout_genius/common/utils/utils.dart';
import 'package:workout_genius/modules/create_session/widgets/add_button.dart';
import 'package:workout_genius/modules/create_session/widgets/name_input_header.dart';
import 'modules/add_exercise_module/add_exercise_ui_new.dart';
import 'modules/session_item_preview_list/session_item_preview_list.dart';

class CreateSessionBottomSheet extends StatefulWidget {
  CreateSessionBottomSheet({super.key});

  @override
  State<CreateSessionBottomSheet> createState() =>
      _CreateSessionBottomSheetState();
}

class _CreateSessionBottomSheetState extends State<CreateSessionBottomSheet> {
  TextEditingController sessionNameController = TextEditingController(
      text: 'Session ${DateFormat('dd-MMMM-hh:mm'
          '').format(DateTime.now())}');

  SessionDto sessionDto = sessions.first;
  ScrollController scrollController = ScrollController();
  bool showAddFloatingButton = false;
  GlobalKey key = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (scrollController.position.pixels <
            scrollController.position.maxScrollExtent-30) {
          showAddFloatingButton = true;
          setState(() {});
        }
      },
    );
    scrollController.addListener(
      () {
        if (Utils.isScrollPositionPastLimit(scrollController,
            limitPercentage: 90)) {
          showAddFloatingButton = false;
          setState(() {});
        } else if (Utils.isScrollPositionPastLimit(scrollController,
            limitPercentage: 80)) {
          showAddFloatingButton = true;
          setState(() {});
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: showAddFloatingButton ? AddButton() : null,
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                NameInputHeaderAppBar(
                  appBarText: AppStrings.createWorkoutSession,
                  textFieldHintText: AppStrings.enterYourSessionName,
                  textController: sessionNameController,
                ),
                SizedBox(
                  height: DesignMetrics().getPageMargin,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: DesignMetrics().getPageMargin,),
                  child: SessionItemsPreviewList(sessionDto: sessionDto),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DotsVertical(),
                ),
                AddButton(
                  key: key,
                ),
              ],
            ),
          ),
        ),
        AddExerciseUiNew(),
      ],
    );
  }
}

