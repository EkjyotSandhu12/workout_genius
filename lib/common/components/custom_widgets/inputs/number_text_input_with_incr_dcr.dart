import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_genius/common/theme/app_colors.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 11),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  ThemeDecorations().commonContainerBoxShadow(),
                ]),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 64,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: textEditingController,
                    textAlign: TextAlign.center,
                    onTapOutside: (e){
                      Utils.hideKeyboard();
                    },
                    inputFormatters: [
                      DecimalTextInputFormatter(
                          decimalPointRange: 2, decimalRange: 3),
                    ],
                    decoration: const InputDecoration().copyWith(
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BtnIcon(
                      icon:  Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: AppColors().getOnPrimaryColor,
                      ),
                      btnProperties: BtnProperties(
                        backgroundColor: AppColors().getPrimaryColor,
                      ),
                      onTap: () {
                        textEditingController.text =
                            addToTextNumberAndRoundUp(
                          number: textEditingController.text,
                          addNumber: -0.5,
                        );
                      },
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    BtnIcon(
                      icon:  Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color:AppColors().getOnPrimaryColor,
                      ),
                      btnProperties: BtnProperties(
                        backgroundColor: AppColors().getPrimaryColor,
                      ),
                      onTap: () {
                        textEditingController.text =
                            addToTextNumberAndRoundUp(
                          number: textEditingController.text,
                          addNumber: 0.5,
                        );
                      },
                    ),
                  ],
                )
              ],
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
