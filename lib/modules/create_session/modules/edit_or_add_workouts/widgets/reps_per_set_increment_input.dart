/*
import 'package:flutter/material.dart';
import '../../../../../../../common/constants/strings.dart';
import '../../../../../common/components/custom_widgets/buttons.dart';
import '../../../../../common/components/custom_widgets/data_input_widget/number_increment_input.dart';
import '../../../../../common/dto/session_dtos/set_dto.dart';
import '../../../../../common/services/log_service.dart';
import '../../../../../common/theme/color_themes.dart';
import '../../../../../common/theme/decorations.dart';
import '../../../../../common/theme/text_styles.dart';
import '../../../../../common/theme/theme_constants.dart';

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
  int currentSelectedSet = 1;
  int currentRepsCount = 1;

  @override
  void didUpdateWidget(covariant RepsPerSetWidget oldWidget) {
    loggy.traceLog("RepsPerSetWidget didUpdateWidget called");
    loggy.traceLog("maxSelectedSets ${widget.maxSelectedSets}");
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

  void updateCurrentSelectSet() {
    currentSelectedSet = widget.repsPerSet[widget.maxSelectedSets - 1].setNo;
    currentRepsCount = widget.repsPerSet[widget.maxSelectedSets - 1].repsCount;
  }

  updateCurrentSelectedSet(int setNo) {
    if (setNo > widget.maxSelectedSets) {
      setNo = 1;
    } else if (setNo < 1) {
      setNo = widget.maxSelectedSets;
    }
    loggy.traceLog("setNo Updated => $setNo");
    currentSelectedSet = setNo;
    currentRepsCount = widget.repsPerSet
        .firstWhere((element) => element.setNo == setNo)
        .repsCount;

    setState(() {});
  }

  updateRepCountForSet(int repsCount) {
    loggy.traceLog("repsCount New => $repsCount");
    if (repsCount > 0) {
      loggy.traceLog("repsCount Updated => $repsCount");
      currentRepsCount = repsCount;
      widget.repsPerSet[currentSelectedSet - 1].repsCount = repsCount;
    }
    setState(() {});
    widget.setsController.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    loggy.traceLog("RepsPerSetWidget rebuild occurred");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: GlobalDecorations.inputFieldHeadingStyle,
        ),
        SizedBox(
          height: ThemeConstants.titleAndTextFieldGap,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: ColorThemes.backgroundColor(),
            borderRadius:ThemeConstants.radiusBigAll,
            boxShadow: [
              GlobalDecorations.cardShadowCustom,
            ],
            border: Border.all(
              color: ColorThemes.defaultTextColor()!.withOpacity(.1),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NumberInputVerticalWithText(
                value: currentSelectedSet,
                sideText: Strings.set,
                onValueChange: updateCurrentSelectedSet,
              ),
              const SizedBox(
                width: 12,
              ),
              NumberInputVerticalWithText(
                onValueChange: updateRepCountForSet,
                value: currentRepsCount,
                sideText: Strings.reps,
              )
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
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BtnIcon(
                onTap: () {
                  widget.onValueChange(++widget.value);
                },
                icon: const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(Icons.arrow_back_ios_sharp, size: 22))),
            const SizedBox(
              height: 4,
            ),
            CircleAvatar(
              backgroundColor: ColorThemes.primaryColor(),
              child: Text(
                "${widget.value}",
                style: TextStyles.bodyLarge(fontWeight: FontWeight.bold)
                    ?.copyWith(color: Colors.white),
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
                icon: const Icon(Icons.arrow_forward_ios_sharp, size: 22),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 4,
        ),
        Opacity(
            opacity: .5,
            child: Text(widget.sideText,
                style: TextStyles.bodyMedium(fontWeight: FontWeight.bold))),
      ],
    );
  }
}
*/
