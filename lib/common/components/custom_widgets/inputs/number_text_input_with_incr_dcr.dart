import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_genius/common/theme/design_metrics.dart';
import 'package:workout_genius/common/theme/theme_decorations.dart';
import 'dart:math' as math;

import '../../../theme/text_styles.dart';
import '../../../utils/utils.dart';
import '../../app_widgets/buttons.dart';

class NumberTextInputWithIncrDcr extends StatelessWidget {
  const NumberTextInputWithIncrDcr(
      {super.key,
      required this.title,
      this.hintText,
      this.crossAxisAlignment,
      required this.textEditingController});

  final String title;
  final String? hintText;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles().getInputsTitleStyle,
          ),
          SizedBox(
            height: DesignMetrics().getTitleInputGap,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  ThemeDecorations().commonContainerBoxShadow(),
                ]),
            padding: const EdgeInsets.all(.7),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: textEditingController,
              inputFormatters: [
                DecimalTextInputFormatter(
                    decimalPointRange: 2, decimalRange: 3),
              ],
              decoration: const InputDecoration().copyWith(
                suffixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BtnIcon(
                      icon: const Icon(
                        Icons.arrow_drop_up,
                        size: 20,
                      ),
                      onTap: () {
                        textEditingController.text = addToTextNumberAndRoundUp(
                          number: textEditingController.text,
                          addNumber: 0.5,
                        );
                      },
                    ),
                    BtnIcon(
                      icon: const Icon(Icons.arrow_drop_down, size: 20),
                      onTap: () {
                        textEditingController.text = addToTextNumberAndRoundUp(
                          number: textEditingController.text,
                          addNumber: -0.5,
                        );
                      },
                    ),
                  ],
                ),
                hintText: hintText,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String addToTextNumberAndRoundUp(
      {required String number, required double addNumber}) {
    double? numb = double.tryParse(number);
    if (numb == null) {
      return addNumber.toString();
    }
    numb += addNumber;
    double roundedValue;
    if (numb.isNegative) {
      roundedValue = 0.00;
    } else {
      roundedValue = ((numb * 2).round() / 2).toDouble();
    }

    return roundedValue.toStringAsFixed(2).toString();
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter(
      {required this.decimalPointRange, required this.decimalRange})
      : assert(decimalPointRange > 0);

  final int decimalPointRange;
  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    int valuePointLength = 0;
    int valueDecimalLength = 0;
    TextSelection newSelection = newValue.selection;
    String updatedValue = newValue.text;
    String value = newValue.text;

    if (value.contains(".") && value.length >= 2) {
      int dotPosition = value.indexOf(".");

      valuePointLength = value.substring(dotPosition + 1).length;
      valueDecimalLength = value.substring(0, dotPosition - 1).length;
    } else {
      valueDecimalLength = value.length;
    }

    if ((valueDecimalLength > decimalRange ||
            valuePointLength > decimalPointRange) &&
        newValue.text.length > oldValue.text.length) {
      updatedValue = oldValue.text;
      newSelection = oldValue.selection;
    } else if (value == ".") {
      updatedValue = "0.0";
      newSelection = newValue.selection.copyWith(
        baseOffset: math.min(updatedValue.length, updatedValue.length + 1),
        extentOffset: math.min(updatedValue.length, updatedValue.length + 1),
      );
    }

    return TextEditingValue(
      text: updatedValue,
      selection: newSelection,
      composing: TextRange.empty,
    );

    return newValue;
  }
}
