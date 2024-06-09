import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class TextStyles {
  static final TextStyles _singleton = TextStyles._internal();

  factory TextStyles() => _singleton;

  TextStyles._internal();

  AppColors appColors = AppColors();

  ///==> COMMON TEXT STYLES GETTERS

  TextStyle get getAppBarTextStyle => TextStyles()
      .getRubikTextStyle(fontSize: 22, fontWeight: VFontWeight.normal);


  //input text field
  TextStyle get getTextFieldErrorTextStyle =>
      getRubikTextStyle(fontSize: 12, color: AppColors().getErrorColor);

  TextStyle get getTextFieldInputTextStyle => getRubikTextStyle(fontSize: 18, fontWeight: VFontWeight.w300);

  //dialog
  TextStyle get getDialogTitleTextStyle =>
      getAboretoTextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  TextStyle get getDialogBodyTextStyle =>
      getAboretoTextStyle(fontSize: 15, fontWeight: FontWeight.normal);

  TextStyle get getDialogBody2TextStyle => getAboretoTextStyle(
      fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white);

  ///==> Text Styles

  getAboretoTextStyle(
      {required double fontSize,
      Color? color,
      FontWeight? fontWeight,
      double? height}) {
    TextStyle temp = GoogleFonts.aboreto(
        height: height,
        color: color ?? appColors.getTextColor,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal);
    return temp;
  }

  getRubikTextStyle(
      {required double fontSize,
      Color? color,
      VFontWeight? fontWeight,
      double? height}) {
    TextStyle temp = TextStyle(
      fontFamily: 'Rubik',
      height: height,
      color: color ?? appColors.getTextColor,
      fontSize: fontSize,
      fontVariations: [
        FontVariation(
          'wght',
          (fontWeight ?? VFontWeight.normal).doubleValue,
        )
      ],
    );
    return temp;
  }
}

enum VFontWeight {
  w100(100.0),
  w200(200.0),
  w300(300.0),
  w400(400.0),
  w500(500.0),
  w600(600.0),
  w700(700.0),
  w800(800.0),
  w900(900.0),
  bold(700.0),
  normal(400.0);

  const VFontWeight(this.doubleValue);

  final double doubleValue;
}
