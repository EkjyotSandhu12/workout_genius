import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:workout_genius/common/app_values/app_strings.dart';
import 'package:workout_genius/common/components/custom_widgets/DotsVertical.dart';
import 'package:workout_genius/common/route/route_service.dart';
import 'package:workout_genius/common/services/loggy_service.dart';
import 'package:workout_genius/common/theme/design_metrics.dart';
import 'package:workout_genius/common/utils/utils.dart';
import 'package:workout_genius/modules/create_session/bloc/create_session_bloc.dart';
import 'package:workout_genius/modules/create_session/widgets/add_button.dart';
import 'package:workout_genius/modules/create_session/widgets/name_input_header.dart';
import 'modules/add_exercise_module/add_exercise_ui_page.dart';
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

  ScrollController scrollController = ScrollController();
  bool showAddFloatingButton = false;
  GlobalKey key = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
/*        if (scrollController.position.pixels <
            scrollController.position.maxScrollExtent - 30) {
          showAddFloatingButton = true;
          setState(() {});
        }
        */
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
        } else {
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateSessionBloc(),
      child: BlocConsumer<CreateSessionBloc, CreateSessionState>(
        listener: (context, state) {
          switch (state.runtimeType) {
            case CreateSessionSuccessState:
              RouteService().pop();
              break;
            case SessionAddedExerciseState:
              myLog.infoLog('Workout Added Updated the widget');
              break;
          }
        },
        builder: (context, state) {
          CreateSessionBloc createSessionBloc =
          context.read<CreateSessionBloc>();
          return PageView(
            children: [
              Scaffold(
                floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
                floatingActionButton: showAddFloatingButton
                    ? FloatingButtonUI(
                  onTap: () {
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear,);
                  },
                )
                    : null,
                body: Column(
                  children: [
                    NameInputHeaderAppBar(
                      appBarText: AppStrings.createSession,
                      textFieldHintText: AppStrings.enterYourSessionName,
                      textController: sessionNameController,
                      appBarButton: AppBarButton(
                        buttonText: AppStrings.create,
                        onTap: () {
                          createSessionBloc.createSession(
                              createSessionBloc.sessionInCreation);
                        },
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            SizedBox(
                              height: DesignMetrics().getPageMargin,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: DesignMetrics().getPageMargin,
                              ),
                              child: SessionItemsPreviewList(
                                  sessionDto:
                                  createSessionBloc.sessionInCreation),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DotsVertical(),
                            ),
                            AddExerciseButton(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const AddExerciseUiPage(),
            ],
          );
        },
      ),
    );
  }
}
