/*
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:workout_management_app/common/components/custom_widgets/widgets/DotsVertical.dart';
import 'package:workout_management_app/common/dto/session_dtos/superset_exercise_dto.dart';
import '../../../../../../../../common/constants/strings.dart';
import '../../../../../../common/Utils/utils.dart';
import '../../../../../../common/components/app_widgets/bold_description_with_button.dart';
import '../../../../../../common/components/app_widgets/custom_text_field/my_text_field.dart';
import '../../../../../../common/components/custom_widgets/buttons.dart';
import '../../../../../../common/components/custom_widgets/data_input_widget/data_input_widgets.dart';
import '../../../../../../common/components/custom_widgets/data_input_widget/minutes_sec_increment_input.dart';
import '../../../../../../common/components/custom_widgets/data_input_widget/number_increment_input.dart';
import '../../../../../../common/components/custom_widgets/widgets/animated_drop_down_menu.dart';
import '../../../../../../common/components/custom_widgets/widgets/clickable_equal_parition_divider.dart';
import '../../../../../../common/dto/session_dtos/break_dto.dart';
import '../../../../../../common/dto/session_dtos/set_dto.dart';
import '../../../../../../common/navigation/navigation_service.dart';
import '../../../../../../common/services/log_service.dart';
import '../../../../../../common/theme/color_themes.dart';
import '../../../../../../common/theme/text_styles.dart';
import '../../../../../../common/theme/theme_constants.dart';
import '../../../../common/theme/decorations.dart';
import '../../helper/ui_helper.dart';
import '../../create_workout_session_provider.dart';
import '../../widget/precise_customization_drop_down.dart';
import '../edit_or_add_workouts/widgets/reps_per_set_increment_input.dart';

class AddSupersetExerciseDialogUI extends StatefulWidget {
  const AddSupersetExerciseDialogUI({
    super.key,
  });

  @override
  State<AddSupersetExerciseDialogUI> createState() =>
      _AddSupersetExerciseDialogUIState();
}

class _AddSupersetExerciseDialogUIState
    extends State<AddSupersetExerciseDialogUI> {
  ///EXERCISE INPUT DATA HANDLER VARIABLES
  NumberIncrementController setsController = NumberIncrementController();
  DurationIncrementController setDurationController =
      DurationIncrementController();
  DurationIncrementController breakDurationController =
      DurationIncrementController();
  List<TextEditingController> exercisesNameControllers = [
    TextEditingController()
  ];
  TextEditingController textWeightController =
      TextEditingController(text: "10.0");
  List<SetDto> repsPerSet = [];

  ///LOGIC VARIABLES
  //Initially exercise set count will be set to 1
  late SessionCreationProvider sCP;
  bool lockGlobalCustomization = false;
  late Debounce debounce;

  @override
  void initState() {
    debounce = Debounce(
      debounceDuration: const Duration(milliseconds: 500),
      function: updateSetsAndBreaksList,
    );

    repsPerSet = [
      SetDto(
        setNo: 1,
        repsCount: 10,
        id: Utils.getRandomIdNo(),
        setDuration: setDurationController.currentDuration.value,
        weight: 10,
      )
    ];

    sCP = Provider.of<SessionCreationProvider>(context, listen: false);
    //Listening to max rep count change.
    setsController.addListener(() {
      loggy.traceLog("setsController listener called");
      int maxSets = setsController.currentNumber;
      if (repsPerSet.length < maxSets) {
        repsPerSet.add(SetDto(
          setNo: maxSets,
          repsCount: 10,
          id: Utils.getRandomIdNo(),
          setDuration: setDurationController.currentDuration.value,
          weight: 10,
        ));
      } else {
        repsPerSet.removeWhere((element) => element.setNo == maxSets + 1);
      }
      debounce.execute();
    });
    setDurationController.currentDuration.addListener(() => setState(() {
          debounce.execute();
        }));
    breakDurationController.currentDuration.addListener(() => setState(() {
          debounce.execute();
        }));
    textWeightController.addListener(() => setState(() {
          debounce.execute();
        }));
    exercisesNameControllers[0].addListener(() {
      updateSetsAndBreaksList();
    });
    debounce.execute();
    super.initState();
  }

  List<dynamic> setsAndBreaksList = []; // will contain setDTO and BreakDTO

  updateSetsAndBreaksList() {
    setsAndBreaksList.clear();
    int totalSets = setsController.currentNumber;

    for (int i = 0; i < totalSets; i++) {
      setsAndBreaksList.addAll(
        exercisesNameControllers.map((e) {
          return SetDto(
              setName: e.text.isNotEmpty
                  ? e.text
                  : 'Exercise ${exercisesNameControllers.indexOf(e) + 1}',
              setNo: i + 1,
              repsCount: repsPerSet
                  .firstWhere((element) => element.setNo == i + 1)
                  .repsCount,
              id: Utils.getRandomIdNo(),
              setDuration: setDurationController.currentDuration.value,
              weight: double.tryParse(textWeightController.text) ?? 0.0);
        }).toList(),
      );
      if (i < totalSets - 1) {
        //not adding breakDTO after last set
        setsAndBreaksList.add(
          BreakDto(
            breakDuration: breakDurationController.currentDuration.value,
            id: Utils.getRandomIdNo(),
            name: "Set break",
          ),
        );
      }
    }
    setState(() {});
  }

  //fix this
  resetSetNumbers(SetDto deletedSet) {
    //after the sets are deleted, the 'set no.' column in precise customization, will show the set no. in in-correct order
    //we are required to fix that order

    bool isCompleteSetNoRemoved = !setsAndBreaksList.any((set) {
      if (set is SetDto) {
        return set.setNo == deletedSet.setNo;
      }
      return false;
    });
    //is there any other set in the list, that has same set no? eg Set no. 1

    loggy.traceLog('isCompleteSetNoRemoved $isCompleteSetNoRemoved');

    if (isCompleteSetNoRemoved) {
      int setNoRemoved = deletedSet.setNo;
      setsAndBreaksList.forEach((set) {
        if (set is SetDto) {
          if (set.setNo >= setNoRemoved) {
            set.setNo--;
          }
        }
      });
    }
  }

  onPreciseCustomizationUpdate([bool lock = true]) {
    lockGlobalCustomization = lock;
    //this function is used to update the dialog, with new updated values.
    //only used in scenario where precise customization values are changed in drop down.
    setState(() {});
  }

  deleteSet(SetDto set) {
    setsAndBreaksList.remove(set);
    resetSetNumbers(set);
    setState(() {});
  }

  deleteBreak(BreakDto breakDto) {
    setState(() {
      setsAndBreaksList.remove(breakDto);
    });
  }

  @override
  Widget build(BuildContext context) {
    loggy.traceLog("AddExerciseDialog Rebuild");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Material(
            borderRadius: ThemeConstants.radiusBigAll,
            child: Container(
              width: 420,
              padding: ThemeConstants.bottomSheetPaddingVer,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Strings.addSupersetExercise,
                      style: TextStyles.titleSmall()),
                  const Divider(),
                  SizedBox(
                    height: ThemeConstants.headerBodyGap,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ImageFiltered(
                        enabled: lockGlobalCustomization,
                        imageFilter: ImageFilter.blur(
                            sigmaX: 3, sigmaY: 3, tileMode: TileMode.decal),
                        child: IgnorePointer(
                          ignoring: lockGlobalCustomization,
                          child: Column(
                            children: [
                              Padding(
                                padding: ThemeConstants.bottomSheetPaddingHor,
                                child: InputWidgets.textFieldWithTitle(
                                  textEditingController:
                                      exercisesNameControllers[0],
                                  title: Strings.enterSupersetExercisesName,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  hintText:
                                      "Exercise 1: Ex: ${Strings.inputExercise}",
                                ),
                              ),
                              ...exercisesNameControllers.map((controller) {
                                if (exercisesNameControllers
                                        .indexOf(controller) >
                                    0) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            ThemeConstants.titleAndTextFieldGap,
                                      ),
                                      Padding(
                                        padding:
                                            ThemeConstants.bottomSheetPaddingHor,
                                        child: MyTextField(
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              Icons
                                                  .remove_circle_outline_outlined,
                                            ),
                                            onPressed: () {
                                              exercisesNameControllers
                                                  .remove(controller);
                                              updateSetsAndBreaksList();
                                            },
                                          ),
                                          controller: controller,
                                          hintText:
                                              'Exercise ${exercisesNameControllers.indexOf(controller) + 1}',
                                        ),
                                      ),
                                    ],
                                  );
                                }
                                return const SizedBox();
                              }).toList(),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child:
                                    DotsVertical(count: 1, height: 24, gap: 0),
                              ),
                              BtnIcon(
                                onTap: () {
                                  exercisesNameControllers
                                      .add(TextEditingController()
                                        ..addListener(() {
                                          updateSetsAndBreaksList();
                                        }));
                                  updateSetsAndBreaksList();
                                },
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: ColorThemes.primaryColor(),
                                  size: 40,
                                ),
                              ),
                              SizedBox(
                                height: ThemeConstants.gapBetweenInputFields,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  NumberIncrementInput(
                                    controller: setsController,
                                    title: Strings.totalSets,
                                    axis: Axis.horizontal,
                                  ),
                                  SizedBox(
                                    width: ThemeConstants.gapBetweenInputFields,
                                  ),
                                  Flexible(
                                    child: InputWidgets.doubleInputWithIncDcr(
                                        textEditingController:
                                            textWeightController,
                                        title:
                                            "${Strings.setsWeight} (${sCP.sessionBeingCreated.weightMetrics.shortForm})",
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        hintText: "Weight"),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ThemeConstants.gapBetweenInputFields,
                              ),
                              RepsPerSetWidget(
                                title: Strings.repsPerSet,
                                maxSelectedSets: setsController.currentNumber,
                                repsPerSet: repsPerSet,
                                setsController: setsController,
                              ),
                              SizedBox(
                                height: ThemeConstants.gapBetweenInputFields,
                              ),
                              DurationIncrementInput(
                                  controller: setDurationController,
                                  title: Strings.eachSetDuration),
                              SizedBox(
                                height: ThemeConstants.gapBetweenInputFields,
                              ),
                              DurationIncrementInput(
                                  controller: breakDurationController,
                                  title: Strings.eachBreakDuration),
                            ],
                          ),
                        ),
                      ),
                      if (lockGlobalCustomization)
                        BoldDescriptionWithButton(
                          onTap: () {
                            setState(() {
                              lockGlobalCustomization = false;
                            });
                          },
                          description: Strings.modifyingValues,
                          buttonText: Strings.unlockModifications,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: ThemeConstants.gapBetweenInputFields,
                  ),
                  PreciseCustomizationDropDown(
                    deleteSet: deleteSet,
                    deleteBreak: deleteBreak,
                    onPreciseCustomizationUpdate: onPreciseCustomizationUpdate,
                    setsAndBreaksList: setsAndBreaksList,
                  ),
                  SizedBox(
                    height: ThemeConstants.bodyFooterGap,
                  ),
                  Padding(
                    padding: ThemeConstants.bottomSheetPaddingHor,
                    child: BtnFilledText(
                      onTap: () {
                        loggy.infoLog(
                            "----------------SUPERSET EXERCISE ADDED------------------------");
                        sCP.addSupersetExercise(
                          supersetDto: SupersetExerciseDTO(
                            supersetExerciseName:
                                exercisesNameControllers.first.text,
                            setsAndBreaksList: setsAndBreaksList,
                            breakDurationBetweenSuperSets:
                                breakDurationController.currentDuration.value,
                            totalSuperSets: setsController.currentNumber,
                            id: Utils.getRandomIdNo(),
                          ),
                        );
                      },
                      stretchButton: true,
                      child: Text(Strings.addExercise),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
