import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class TextStyles {
  static final TextStyles _singleton = TextStyles._internal();

  factory TextStyles() => _singleton;

  TextStyles._internal();

  AppColors appColors = AppColors();

  ///==> TEXT STYLES GETTERS
  
  //headings
  TextStyle get getHeading18Normal => _getF18TextStyle(fontWeight: FontWeight.w500);
  TextStyle get getHeading18Bold => _getF18TextStyle(fontWeight: FontWeight.bold);

  
  //body
  TextStyle get getBody14Normal => _getF14TextStyle(fontWeight: FontWeight.w500);



  
  //buttons
  TextStyle get boldButtonTextStyle => _getF18TextStyle(fontWeight: FontWeight.w500);

  //input text field
  TextStyle get textFieldErrorTextStyle => _getF12TextStyle(color: AppColors().getErrorColor);
  TextStyle get textFieldInputTextStyle => _getF18TextStyle(fontWeight: FontWeight.w500,);

  //dialog
  TextStyle get getDialogTitleTextStyle => getHeading18Normal;
  TextStyle get getDialogBodyTextStyle => _getF15TextStyle(fontWeight: FontWeight.normal);
  TextStyle get getDialogBody2TextStyle => _getF18TextStyle(fontWeight: FontWeight.normal, color: Colors.white);

  ///==> Text Styles
  TextStyle _getF18TextStyle({Color? color, FontWeight? fontWeight}) {
    return _getTextStyle(fontSize: 18, color: color, fontWeight: fontWeight);
  }
  TextStyle _getF15TextStyle({Color? color, FontWeight? fontWeight}) {
    return _getTextStyle(fontSize: 15, color: color, fontWeight: fontWeight);
  }

  TextStyle _getF14TextStyle({Color? color, FontWeight? fontWeight}) {
    return _getTextStyle(fontSize: 14, color: color, fontWeight: fontWeight);
  }

  TextStyle _getF12TextStyle({Color? color, FontWeight? fontWeight}) {
    return _getTextStyle(fontSize: 12, color: color, fontWeight: fontWeight);
  }

  _getTextStyle(
      {required double fontSize, Color? color, FontWeight? fontWeight}) {
    TextStyle temp = GoogleFonts.lato(
        color: color ?? appColors.getTextColor,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal);
    return temp;
  }
}
