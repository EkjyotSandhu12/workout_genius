import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:workout_genius/common/components/custom_widgets/inputs/number_text_input_with_incr_dcr.dart';
import 'package:workout_genius/modules/create_session/modules/add_exercise_module/widgets/reps_per_set_increment_input.dart';
import '../../../../../../common/theme/text_styles.dart';
import '../../../../common/app_values/app_strings.dart';
import '../../../../common/common_dtos/session/session_dto.dart';
import '../../../../common/components/custom_widgets/inputs/minutes_sec_increment_input.dart';
import '../../../../common/components/custom_widgets/inputs/number_increment_input.dart';
import '../../../../common/components/custom_widgets/inputs/text_field_with_title.dart';
import '../../../../common/utils/debounce.dart';
import '../../widgets/name_input_header.dart';
import '../../widgets/precise_customization_drop_down.dart';

class AddExerciseUiNew extends StatefulWidget {
  const AddExerciseUiNew({
    super.key,
  });

  @override
  State<AddExerciseUiNew> createState() => _AddExerciseUiNewState();
}

class _AddExerciseUiNewState extends State<AddExerciseUiNew> {
  ///EXERCISE DATA HANDLER VARIABLES
  late Debounce debounce;
  NumberIncrementController setsController = NumberIncrementController();
  DurationIncrementController setDurationController =
      DurationIncrementController();
  DurationIncrementController breakDurationController =
      DurationIncrementController();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textWeightController =
      TextEditingController(text: "10.0");
  List<SetDto> repsPerSet = [

  ];

  @override
  void initState() {
    super.initState();
  }

  List<dynamic> setsAndBreaksList = []; // will contain setDTO and BreakDTO

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NameInputHeaderAppBar(
              appBarText: AppStrings.addExercise,
              textFieldHintText:
                  "${AppStrings.enterExerciseName} (ex: Push ups/Crunches.....)",
              textController: TextEditingController(),
            ),
            const SizedBox(
              height: 12,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                ImageFiltered(
                  enabled: false,
                  imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: IgnorePointer(
                    ignoring: false,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            NumberIncrementInput(
                              controller: setsController,
                              title: AppStrings.totalSets,
                              axis: Axis.horizontal,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Flexible(
                              child: NumberTextInputWithIncrDcr(
                                textEditingController: textWeightController,
                                title: AppStrings.setsWeight,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                hintText: "Weight",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        RepsPerSetWidget(
                          title: 'Strings.repsPerSet',
                          maxSelectedSets: setsController.currentNumber,
                          repsPerSet: repsPerSet,
                          setsController: setsController,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        DurationIncrementInput(
                            controller: setDurationController,
                            title: ' Strings.eachSetDuration'),
                        SizedBox(
                          height: 12,
                        ),
                        DurationIncrementInput(
                            controller: breakDurationController,
                            title: 'Strings.eachBreakDuration'),
                      ],
                    ),
                  ),
                ),

                /*                if (lockGlobalCustomization)
                  BoldDescriptionWithButton(
                    onTap: () {
                      setState(() {
                        lockGlobalCustomization = false;
                      });
                    },
                    description: Strings.modifyingValues,
                    buttonText: Strings.unlockModifications,
                  ),

                */
              ],
            ),
            SizedBox(
              height: 12,
            ),
            PreciseCustomizationDropDown(
              setsAndBreaksList: setsAndBreaksList,
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
