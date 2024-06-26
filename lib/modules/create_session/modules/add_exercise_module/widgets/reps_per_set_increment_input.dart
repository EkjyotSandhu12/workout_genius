import 'package:flutter/material.dart';
import 'package:workout_genius/common/theme/text_styles.dart';
import '../../../../../common/app_values/app_strings.dart';
import '../../../../../common/common_dtos/session/session_dto.dart';
import '../../../../../common/components/app_widgets/buttons.dart';
import '../../../../../common/components/custom_widgets/inputs/number_increment_input.dart';
import '../../../../../common/services/loggy_service.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/theme/theme_decorations.dart';

class RepsPerSetWidget extends StatefulWidget {
  RepsPerSetWidget(
      {super.key,
      required this.title,
      required this.repsPerSet,
      required this.maxSelectedSets,
      required this.setsController});

  final String title;
  List<SetDto> repsPerSet;
  final int maxSelectedSets;
  final NumberIncrementController setsController;

  @override
  State<RepsPerSetWidget> createState() => _DurationIncrementInputState();
}

class _DurationIncrementInputState extends State<RepsPerSetWidget> {


  @override
  void didUpdateWidget(covariant RepsPerSetWidget oldWidget) {
    if (widget.maxSelectedSets < currentSelectedSet) {
      updateCurrentSelectSet();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    updateCurrentSelectSet();
    super.initState();
  }

  int currentSelectedSet = 1;
  int currentRepsCount = 1;

  void updateCurrentSelectSet() {
    currentSelectedSet = widget.repsPerSet[widget.maxSelectedSets - 1].setNo;
    currentRepsCount = widget.repsPerSet[widget.maxSelectedSets - 1].reps;
  }

  updateCurrentSelectedSet(int setNo) {
    if (setNo > widget.maxSelectedSets) {
      setNo = 1;
    } else if (setNo < 1) {
      setNo = widget.maxSelectedSets;
    }
    currentSelectedSet = setNo;
    currentRepsCount =
        widget.repsPerSet.firstWhere((element) => element.setNo == setNo).reps;
    setState(() {});
  }

  updateRepCountForSet(int repsCount) {
    myLog.traceLog("repsCount New => $repsCount");
    if (repsCount > 0) {
      myLog.traceLog("repsCount Updated => $repsCount");
      currentRepsCount = repsCount;
      widget.repsPerSet[currentSelectedSet - 1].reps = repsCount;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: TextStyles().getInputsTitleStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              ThemeDecorations().commonContainerBoxShadow(),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NumberInputVerticalWithText(
                value: currentSelectedSet,
                sideText: AppStrings.set,
                onValueChange: updateCurrentSelectedSet,
              ),
              const SizedBox(
                width: 12,
              ),
              NumberInputVerticalWithText(
                onValueChange: updateRepCountForSet,
                value: currentRepsCount,
                sideText: AppStrings.totalReps,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NumberInputVerticalWithText extends StatefulWidget {
  NumberInputVerticalWithText({
    super.key,
    required this.sideText,
    required this.value,
    required this.onValueChange,
  });

  final String sideText;
  late int value;
  final Function onValueChange;

  @override
  State<NumberInputVerticalWithText> createState() =>
      _NumberInputVerticalWithTextState();
}

class _NumberInputVerticalWithTextState
    extends State<NumberInputVerticalWithText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors().getPrimaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BtnIcon(
                onTap: () {
                  widget.onValueChange(++widget.value);
                },
                icon: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 22,
                    color: AppColors().getOnPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              CircleAvatar(
                backgroundColor: AppColors().getOnPrimaryColor,
                child: Text(
                  "${widget.value}",
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              RotatedBox(
                quarterTurns: 1,
                child: BtnIcon(
                  onTap: () {
                    widget.onValueChange(--widget.value);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 22,
                    color: AppColors().getOnPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            widget.sideText,
            style: TextStyles().getRubikTextStyle(
                fontSize: 14, fontWeight: VFontWeight.w500),
          ),
        ),
      ],
    );
  }
}
