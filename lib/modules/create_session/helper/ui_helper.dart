/*
import 'package:flutter/material.dart';
import '../../../common/Utils/utils.dart';
import '../../../common/theme/theme_constants.dart';

class CreateWorkoutSessionUiHelper {

  ///


  ///==> SECTION: Precise Customization Tile Modification

  onWorkoutNameChange(
      {required SetDto set,
      required Function updateParentWidgetState,
      required BuildContext context}) {
    TextEditingController textEditingController =
        TextEditingController(text: set.setName);
    textEditingController.addListener(() {
      set.setName = textEditingController.text;
      if (set.setName?.isEmpty ?? false) {
        set.setName = 'No Name';
      }
      updateParentWidgetState();
    });
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 360,
            margin: EdgeInsets.only(bottom: Utils.viewInsetsBottom()),
            padding: ThemeConstants.bottomSheetPaddingAll,
            decoration: BoxDecoration(
              borderRadius: ThemeConstants.radiusBigAll,
              color: Colors.white,
            ),
            child: InputWidgets.textFieldWithTitle(
              textEditingController: textEditingController,
              title: Strings.ChangeExerciseName,
              crossAxisAlignment: CrossAxisAlignment.center,
              hintText: "Exercise 1: Ex: ${Strings.inputExercise}",
            ),
          ),
        ),
      ),
    );
  }

  onTotalRepsClicked({
    required Function updateParentWidgetState,
    required SetDto set,
    required BuildContext context,
  }) async {
    NumberIncrementController controller =
        NumberIncrementController(count: set.repsCount);
    controller.addListener(() {
      set.repsCount = controller.currentNumber;
      updateParentWidgetState();
    });
    await showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          padding: ThemeConstants.bottomSheetPaddingAll,
          decoration: BoxDecoration(
            borderRadius: ThemeConstants.radiusBigAll,
            color: Colors.white,
          ),
          child: NumberIncrementInput(
            controller: controller,
            title: Strings.totalSets,
            axis: Axis.horizontal,
          ),
        ),
      ),
    );
  }

  onWeightClicked({
    required Function updateParentWidgetState,
    required SetDto set,
    required BuildContext context,
    required String metricShortForm,
  }) async {
    TextEditingController textWeightController =
        TextEditingController(text: "${set.weight}");
    textWeightController.addListener(() {
      set.weight = double.tryParse(textWeightController.text) ?? 0.0;
      updateParentWidgetState();
    });
    await showDialog(
      context: context,
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(bottom: Utils.viewInsetsBottom()),
            padding: ThemeConstants.bottomSheetPaddingAll,
            decoration: BoxDecoration(
              borderRadius: ThemeConstants.radiusBigAll,
              color: Colors.white,
            ),
            child: InputWidgets.doubleInputWithIncDcr(
                textEditingController: textWeightController,
                title: "${Strings.setsWeight} (${metricShortForm})",
                crossAxisAlignment: CrossAxisAlignment.center,
                hintText: "Weight"),
          ),
        ),
      ),
    );
  }

  onSetDurationClicked({
    required Function updateParentWidgetState,
    required SetDto set,
    required BuildContext context,
  }) async {
    DurationIncrementController setDurationController =
        DurationIncrementController(duration: set.setDuration);
    setDurationController.currentDuration.addListener(() {
      set.setDuration = setDurationController.currentDuration.value;
      updateParentWidgetState();
    });
    await showDialog(
      context: context,
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(bottom: Utils.viewInsetsBottom()),
            padding: ThemeConstants.bottomSheetPaddingAll,
            decoration: BoxDecoration(
              borderRadius: ThemeConstants.radiusBigAll,
              color: Colors.white,
            ),
            child: DurationIncrementInput(
                controller: setDurationController, title: Strings.setDuration),
          ),
        ),
      ),
    );
  }

  onBreakDurationClicked({
    required Function updateParentWidgetState,
    required BreakDto breakDto,
    required BuildContext context,
  }) async {
    DurationIncrementController setDurationController =
        DurationIncrementController(duration: breakDto.breakDuration);
    setDurationController.currentDuration.addListener(() {
      breakDto.breakDuration = setDurationController.currentDuration.value;
      updateParentWidgetState();
    });
    await showDialog(
      context: context,
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(bottom: Utils.viewInsetsBottom()),
            padding: ThemeConstants.bottomSheetPaddingAll,
            decoration: BoxDecoration(
              borderRadius: ThemeConstants.radiusBigAll,
              color: Colors.white,
            ),
            child: DurationIncrementInput(
                controller: setDurationController,
                title: Strings.breakDuration),
          ),
        ),
      ),
    );
  }
}
*/
