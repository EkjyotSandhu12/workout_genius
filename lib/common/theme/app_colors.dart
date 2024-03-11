
import 'package:flutter/material.dart';

class AppColors{
  static final AppColors _singleton = AppColors._internal();
  factory AppColors() => _singleton;
  AppColors._internal();

  ///=> Getter methods to fetch colors based on theme
  Color get appBarColor =>  _primaryColor;
  Color get secondaryColor => _secondaryColor;
  Color get textColor => _textColor;
  Color get textColorRed => _textColorRed;


  ///==> Define your color variables here
  final Color _primaryColor = const Color(0xFF213555);
  final Color _secondaryColor = const Color(0xFFD8C4B6);
  final Color _secondaryVariant = const Color(0xFFF5EFE7);

  //other colors
  final Color myRed = const Color(0xFFFF0000);
  final Color myGreen = const Color(0xFF229A2B);
  final Color lightGrey = const Color(0xFF9A9A9A);


  //text colors
  final Color _textColorRed = const Color(0xFFFF6C6C);
  final Color _textColor = const Color(0xFFFFFFFF);




  ///======================================================///
  //=> Boolean variable to track current theme
  ValueNotifier<bool>  isDarkTheme = ValueNotifier<bool>(false);
  // Method to switch between dark and light themes
  void switchTheme() {
    isDarkTheme.value = !isDarkTheme.value;
  }

  // Method to manually set the theme
  void setDarkTheme(bool isDark) {
    isDarkTheme.value = isDark;
  }
  
  
  
}