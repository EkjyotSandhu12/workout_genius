
import 'package:flutter/material.dart';

class AppColors{
  static final AppColors _singleton = AppColors._internal();
  factory AppColors() => _singleton;
  AppColors._internal();

  ///=> Getter methods to fetch colors based on theme
  //others
  Color get getErrorColor => _errorColor;
  Color get getTextColor => _textColor;
  Color get getPrimaryColor => _primaryColor;

  //buttons
  Color get getButtonBackgroundColor => _primaryColor;
  Color get getButtonTextColour => _onPrimaryColor;

  //text field
  Color get getCursorColor => _onPrimaryColor;
  Color get getTextFieldBackgroundColor => _accentColor;
  Color get getTextInputColor => _textColor;

  //background colors
  Color get getTileBackgroundColor => _primaryColor;
  Color get getTileBackgroundColor2 => _tertiaryColor;
  Color get getDialogBackgroundColor => _scaffoldBackgroundColor;

  //icons colors
  Color get getIconColor => _iconColor;
  Color get getIconBackgroundColor => _primaryColor;

  //loaders
  Color get getLoaderColor => _primaryColor;



  ///==> Define your color variables here
// Primary and Secondary Colors
  final Color _primaryColor =  Color(0xFFD6EDFF);
  final Color _onPrimaryColor = Colors.white; // Color used on top of primaryColor
  final Color _secondaryColor = Color(0xFFFBF3D5);
  final Color _tertiaryColor = Color(0xff9CAFAA);

// Accent and Highlight Colors
  final Color _accentColor = Color(0xffD6DAC8);
  final Color _errorColor = Colors.red;

// Text Colors
  final Color _textColor = Color(0xFF000000);

// Background and Icon Colors
  final Color _scaffoldBackgroundColor = Colors.white;
  final Color _iconColor = Colors.white;




  ///======================================================///
  //=> Boolean variable to track current theme
  ValueNotifier<bool>  isDarkTheme = ValueNotifier<bool>(false);
  // Method to switch between dark and light themes
  // Method to manually set the theme
  void setTheme(bool isDark) {
    isDarkTheme.value = isDark;
  }
  
  
  
}