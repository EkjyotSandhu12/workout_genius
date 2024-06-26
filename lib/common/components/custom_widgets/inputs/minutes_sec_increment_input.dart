import 'package:flutter/material.dart';
import 'package:workout_genius/common/theme/text_styles.dart';
import 'package:workout_genius/common/theme/theme_decorations.dart';

import '../../../app_values/app_strings.dart';
import '../../../theme/app_colors.dart';
import '../../app_widgets/buttons.dart';

class DurationIncrementController {
  ValueNotifier<Duration> currentDuration =
      ValueNotifier<Duration>(Duration(seconds: 45));

  DurationIncrementController({Duration? duration}) {
    currentDuration =
        ValueNotifier<Duration>(duration ?? Duration(seconds: 45));
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
          style: TextStyles().getInputsTitleStyle,
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors().getOnPrimaryColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              ThemeDecorations().commonContainerBoxShadow(),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NumberInputVerticalWithText(
                  sideText: AppStrings.minutes,
                  dIC: widget.controller,
                  durationType: DurationType.minute,
                  updateDuration: updateDuration),
              SizedBox(
                width: 12,
              ),
              NumberInputVerticalWithText(
                sideText: AppStrings.seconds,
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
                  widget.updateDuration(
                      widget.durationType == DurationType.seconds ? 1 : 60);
                },
                icon:  RotatedBox(
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
                  "${widget.durationType == DurationType.seconds ? widget.dIC.currentDuration.value.inSeconds - (60 * widget.dIC.currentDuration.value.inMinutes) : widget.dIC.currentDuration.value.inMinutes}",
                ),
              ),
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
                  icon:  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 22,
                    color: AppColors().getOnPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Opacity(
            opacity: .5,
            child: Text(
              "${widget.sideText}",
              style: TextStyles().getRubikTextStyle(
                  fontSize: 14, fontWeight: VFontWeight.w500),
            )),
      ],
    );
  }
}
