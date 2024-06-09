/*
import 'package:flutter/material.dart';
import '../../../../../../common/Utils/utils.dart';
import '../../../../../../common/theme/text_styles.dart';
import '../../../../../../common/theme/theme_constants.dart';
import '../../../../common/common_dtos/session/session_dto.dart';
import '../../../../common/components/custom_widgets/minutes_sec_increment_input.dart';
import '../../../../common/components/custom_widgets/number_increment_input.dart';
import '../../../../common/utils/debounce.dart';
import '../../widget/precise_customization_drop_down.dart';
import '../edit_or_add_workouts/widgets/reps_per_set_increment_input.dart';

class AddExerciseDialogUI extends StatefulWidget {
  const AddExerciseDialogUI({
    super.key,
  });

  @override
  State<AddExerciseDialogUI> createState() => _AddExerciseDialogUIState();
}

class _AddExerciseDialogUIState extends State<AddExerciseDialogUI> {
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
  List<SetDto> repsPerSet = [];

  ///LOGIC VARIABLES
  //Initially exercise set count will be set to 1
  bool lockGlobalCustomization = false;

  @override
  void initState() {
    debounce = Debounce(
      debounceDuration: const Duration(milliseconds: 500),
      function: updateSetsAndBreaksList,
    );

    repsPerSet = [
      SetDto(
        setNo: 1,
        reps: 10,
        // id: Utils.getRandomIdNo(),
        setTotalDuration: setDurationController.currentDuration.value,
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
    textEditingController.addListener(() {
      updateSetsNames();
      setState(() {});
    });

    debounce.execute();
    super.initState();
  }

  List<dynamic> setsAndBreaksList = []; // will contain setDTO and BreakDTO

  updateSetsAndBreaksList() {
    setsAndBreaksList.clear();
    int totalSets = setsController.currentNumber;
    String workoutName = textEditingController.text.isEmpty
        ? "My Workout"
        : textEditingController.text;

    for (int i = 0; i < totalSets; i++) {
      setsAndBreaksList.add(
        SetDto(
            setName: workoutName,
            setNo: i + 1,
            repsCount: repsPerSet
                .firstWhere((element) => element.setNo == i + 1)
                .repsCount,
            id: Utils.getRandomIdNo(),
            setDuration: setDurationController.currentDuration.value,
            weight: double.tryParse(textWeightController.text) ?? 0.0),
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

  updateSetsNames() {
    setsAndBreaksList.forEach((element) {
      if (element is SetDto) {
        element.setName = textEditingController.text.isNotEmpty
            ? textEditingController.text
            : 'My Workout';
      }
    });
  }

  resetSetNumbers() {
    //after the sets are deleted, the 'set no.' column in precise customization, will show the set no. in in-correct order
    //we are required to fix that order
    int setNoCount = 1;
    setsAndBreaksList.forEach((data) {
      if (data is SetDto) {
        data.setNo = setNoCount;
        setNoCount++;
      }
    });
  }

  onPreciseCustomizationUpdate([bool lock = true]) {
    lockGlobalCustomization = lock;
    //this function is used to update the dialog, with new updated values.
    //only used in scenario where precise customization values are changed in drop down.
    setState(() {});
  }

  deleteSet(SetDto set) {
    setsAndBreaksList.remove(set);
    resetSetNumbers();
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
              padding: ThemeConstants.bottomSheetPaddingVer,
              width: 420,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Strings.addExercise, style: TextStyles.titleSmall()),
                  const Divider(),
                  SizedBox(
                    height: ThemeConstants.headerBodyGap,
                  ),
                  Padding(
                    padding: ThemeConstants.bottomSheetPaddingHor,
                    child: InputWidgets.textFieldWithTitle(
                      textEditingController: textEditingController,
                      title: Strings.enterExerciseName,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      hintText: "Ex: Push ups/Pull ups/Crunches.....",
                    ),
                  ),
                  SizedBox(
                    height: ThemeConstants.gapBetweenInputFields,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ImageFiltered(
                        enabled: lockGlobalCustomization,
                        imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: IgnorePointer(
                          ignoring: lockGlobalCustomization,
                          child: Column(
                            children: [
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
                                            "${Strings.setsWeight} (${sCP.sessionBeingCreated?.weightMetrics.shortForm})",
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
                  BtnFilledText(
                    onTap: () {
                      loggy.infoLog(
                          "----------------EXERCISE ADDED------------------------");
                      loggy.infoLog(
                          "textEditingController.text ${textEditingController.text}");
                      loggy.infoLog(
                          "setsController.currentNumber ${setsController.currentNumber}");
                      loggy.infoLog(
                          "breakDurationController.currentDuration ${breakDurationController.currentDuration}");
                      loggy.infoLog(
                          "setDurationController.currentDuration ${setDurationController.currentDuration}");
                      loggy.infoLog("repsPerSet $repsPerSet");

                      int totalSets = setsController.currentNumber;
                      String workoutName = textEditingController.text.isEmpty
                          ? "Workout 101"
                          : textEditingController.text;

                      sCP.addExercise(
                        exerciseDTO: ExerciseDTO(
                            exerciseName: workoutName,
                            totalSets: totalSets,
                            eachSetDuration:
                                setDurationController.currentDuration.value,
                            eachBreakDuration:
                                breakDurationController.currentDuration.value,
                            setsAndBreaksList: setsAndBreaksList,
                            id: Utils.getRandomIdNo(),
                            weight:
                                double.tryParse(textWeightController.text) ??
                                    10.0),
                      );
                    },
                    stretchButton: true,
                    child: Text(Strings.addExercise),
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
