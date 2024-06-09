import 'package:flutter/material.dart';

import '../../app_widgets/buttons.dart';

class DurationIncrementController {
  ValueNotifier<Duration> currentDuration =
      ValueNotifier<Duration>(Duration(seconds: 45));

  DurationIncrementController({Duration? duration}){
    currentDuration =  ValueNotifier<Duration>(duration ?? Duration(seconds: 45));
  }

}

class DurationIncrementInput extends StatefulWidget {
  const DurationIncrementInput(
      {super.key, required this.controller, required this.title});

  final DurationIncrementController controller;
  final String title;

  @override
  State<DurationIncrementInput> createState() => _DurationIncrementInputState();
}

enum DurationType { seconds, minute }

class _DurationIncrementInputState extends State<DurationIncrementInput> {
  updateDuration(int number) {
    Duration newDuration =
        widget.controller.currentDuration.value + Duration(seconds: number);
    if (newDuration.isNegative) {
      return;
    }
    widget.controller.currentDuration.value = newDuration;
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
        ),
        SizedBox(
          height:12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius:BorderRadius.circular(12),
            boxShadow: [
            ],
            border: Border.all(
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NumberInputVerticalWithText(
                  sideText: 'Strings.minutes',
                  dIC: widget.controller,
                  durationType: DurationType.minute,
                  updateDuration: updateDuration),
              SizedBox(
                width: 12,
              ),
              NumberInputVerticalWithText(
                sideText: 'Strings.seconds',
                dIC: widget.controller,
                durationType: DurationType.seconds,
                updateDuration: updateDuration,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class NumberInputVerticalWithText extends StatefulWidget {
  const NumberInputVerticalWithText({
    super.key,
    required this.sideText,
    required this.durationType,
    required this.updateDuration,
    required this.dIC,
  });

  final String sideText;
  final DurationType durationType;
  final Function updateDuration;
  final DurationIncrementController dIC;

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BtnIcon(
                  onTap: () {
                    widget.updateDuration(
                        widget.durationType == DurationType.seconds ? 1 : 60);
                  },
                  icon: const RotatedBox(
                      quarterTurns: 1,
                      child: Icon(Icons.arrow_back_ios_sharp, size: 22))),
              const SizedBox(
                height: 4,
              ),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "${widget.durationType == DurationType.seconds ? widget.dIC.currentDuration.value.inSeconds - (60 * widget.dIC.currentDuration.value.inMinutes) : widget.dIC.currentDuration.value.inMinutes}",
                  )),
              const SizedBox(
                height: 4,
              ),
              RotatedBox(
                quarterTurns: 1,
                child: BtnIcon(
                  onTap: () {
                    widget.updateDuration(
                        widget.durationType == DurationType.seconds ? -1 : -60);
                  },
                  icon: const Icon(Icons.arrow_forward_ios_sharp, size: 22),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Opacity(
            opacity: .5,
            child: Text("${widget.sideText}",)),
      ],
    );
  }
}
