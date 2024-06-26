import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_genius/common/components/app_widgets/buttons.dart';
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
  ///==> Controllers
  late Debounce debounce;
  NumberIncrementController setsController = NumberIncrementController();
  DurationIncrementController setDurationController =
      DurationIncrementController();
  DurationIncrementController breakDurationController =
      DurationIncrementController();
  TextEditingController textWeightController =
      TextEditingController(text: "10.0");

  ///==> static values
 static getSetObject(int setNo){
    return  SetDto(
      setTotalDuration: const Duration(seconds: 45),
      reps: 12,
      setNo: setNo,);
  }

  ///==> Exercise workout states
  List<SetDto> setsList = [getSetObject(1)];

  // List<WorkoutItem> setsAndBreaksList = []; //Will contain setDTO and BreakDTO //this the is complete set.

  @override
  void initState() {
    ///==> On change of totalSets
    setsController.addListener(() {
      if (setsController.currentNumber > setsList.length) {
        setsList.add(getSetObject(setsController.currentNumber));
      }
      setState(() {});
    });

    ///==> On Change of sets durations
    setDurationController.currentDuration.addListener(() {
      //updating the duration of each set in the sets list.
      setsList.forEach((set) {
        set.setTotalDuration = setDurationController.currentDuration.value;
      });
    });

    ///==> On Change of break durations
    breakDurationController.currentDuration.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NameInputHeaderAppBar(
            appBarText: AppStrings.addExercise,
            textFieldHintText:
            "${AppStrings.enterExerciseName} (ex: Push ups/Crunches.....)",
            textController: TextEditingController(),
            appBarButton: AppBarButton(buttonText: AppStrings.addWorkout, onTap: () {

            }),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    NumberIncrementInput(
                                      controller: setsController,
                                      title: AppStrings.totalSets,
                                      axis: Axis.horizontal,
                                    ),
                                    NumberTextInputWithIncrDcr(
                                      textEditingController: textWeightController,
                                      title: AppStrings.eachSetsWeight,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      hintText: "weight",
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                RepsPerSetWidget(
                                  title: AppStrings.repsPerSet,
                                  maxSelectedSets: setsController.currentNumber,
                                  repsPerSet: setsList,
                                  setsController: setsController,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                DurationIncrementInput(
                                    controller: setDurationController,
                                    title: AppStrings.eachSetDuration),
                                const SizedBox(
                                  height: 24,
                                ),
                                DurationIncrementInput(
                                    controller: breakDurationController,
                                    title: AppStrings.eachBreakDuration,),
                              ],
                            ),
                          ),
                        ),
            
                        /* f (lockGlobalCustomization)
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
                    /*          PreciseCustomizationDropDown(
                      setsAndBreaksList: setsAndBreaksList,
                    ),*/
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
