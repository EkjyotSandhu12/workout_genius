import 'package:flutter/material.dart';
import '../../../../../common/common_dtos/session/session_dto.dart';
import '../../../../../common/components/app_widgets/buttons.dart';
import '../../../../../common/components/custom_widgets/inputs/number_increment_input.dart';
import '../../../../../common/services/loggy_service.dart';

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
    currentRepsCount = widget.repsPerSet[widget.maxSelectedSets - 1].reps;
  }

  updateCurrentSelectedSet(int setNo) {
    if (setNo > widget.maxSelectedSets) {
      setNo = 1;
    } else if (setNo < 1) {
      setNo = widget.maxSelectedSets;
    }
    currentSelectedSet = setNo;
    currentRepsCount = widget.repsPerSet.firstWhere((element) => element.setNo == setNo).reps;
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
    widget.setsController.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NumberInputVerticalWithText(
                value: currentSelectedSet,
                sideText: 'Strings.sa',
                onValueChange: updateCurrentSelectedSet,
              ),
              const SizedBox(
                width: 12,
              ),
              NumberInputVerticalWithText(
                onValueChange: updateRepCountForSet,
                value: currentRepsCount,
                sideText: ' Strings.reps',
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
          child: Text(
            widget.sideText,
          ),
        ),
      ],
    );
  }
}
