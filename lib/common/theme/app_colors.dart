
import 'package:flutter/material.dart';

class AppColors{
  static final AppColors _singleton = AppColors._internal();
  factory AppColors() => _singleton;
  AppColors._internal();


  ///==> Define your color variables here
// Primary and Secondary Colors
  final Color getPrimaryColor =  Color(0xFF00ADA1);
  final Color getPrimaryShade1Color =  Color(0xFFccfffb);
  final Color getOnPrimaryColor = Colors.white; // Color used on top of primaryColor
  final Color getSecondaryColor = Color(0xFF222831);
  final Color getOnSecondaryColor = Color(0xffEEEEEE);

  //others
  final Color getTextColor = Colors.black;

// Accent and Highlight Colors
  final Color getErrorColor = Colors.red;

// Background and Icon Colors
  final Color getScaffoldBackgroundColor = Colors.white;




  ///======================================================///
  //=> Boolean variable to track current theme
  ValueNotifier<bool>  isDarkTheme = ValueNotifier<bool>(false);
  // Method to switch between dark and light themes
  // Method to manually set the theme
  void setTheme(bool isDark) {
    isDarkTheme.value = isDark;
  }
  
  
  
}