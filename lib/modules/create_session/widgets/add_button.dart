import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:workout_genius/common/components/app_widgets/buttons.dart';
import '../../../common/app_values/app_strings.dart';
import '../../../common/components/custom_widgets/clickable_widget_overlay.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_styles.dart';

class AddExerciseButton extends StatefulWidget {
  AddExerciseButton({
    super.key,
  });

  @override
  State<AddExerciseButton> createState() => _AddExerciseButtonState();
}

class _AddExerciseButtonState extends State<AddExerciseButton> {
  bool isExpanded = true;

  Size buttonSize = const Size(200, 40);

  List<Map> buttons = [
    {'buttonText': 'Add Exercise', 'onTap': () {}},
    {'buttonText': 'Add Super-Set', 'onTap': () {}},
    {'buttonText': 'Add Drop-Set', 'onTap': () {}},
    {'buttonText': 'Add Break', 'onTap': () {}},
  ];

  @override
  Widget build(BuildContext context) {
    double addButtonSize = 55;
    double expandedHeight = buttons.length * (buttonSize.height + 14);
    double expandedWidth = buttonSize.width + 18;

    return ClickableWidgetOverlay(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        isExpanded = !isExpanded;
        setState(() {});
      },
      widget: AnimatedContainer(
        curve: Curves.ease,
        duration: const Duration(milliseconds: 200),
        height: isExpanded ? expandedHeight : addButtonSize,
        width: isExpanded ? expandedWidth : addButtonSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.2),
                spreadRadius: .3,
                blurRadius: 2),
          ],
          color: AppColors().getPrimaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FittedBox(
          child: isExpanded
              ? Column(
            mainAxisSize: MainAxisSize.min,
                  children: [
                    ...buttons.map(
                      (e) => BtnElevated(
                        onTap: () {
                          e['onTap'];
                        },
                        buttonText: e['buttonText'],
                        btnProperties: BtnProperties(
                          size: buttonSize,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              : AddButtonUI(),
        ),
      ),
    );
  }
}

class FloatingButtonUI extends StatelessWidget {
   FloatingButtonUI({super.key, required this.onTap});

 final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ClickableWidgetOverlay(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        onTap();
      },
      widget: Container(
        height: 55,
        width: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.2),
                spreadRadius: .3,
                blurRadius: 2),
          ],
          color: AppColors().getPrimaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AddButtonUI(),
      ),
    );
  }
}


class AddButtonUI extends StatelessWidget {
  const AddButtonUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Text(
          AppStrings.add.toUpperCase(),
          style: TextStyles().getRubikTextStyle(
              fontSize: 13, fontWeight: VFontWeight.w500),
        ),
      );
  }
}
