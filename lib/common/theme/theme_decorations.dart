import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'app_colors.dart';
import 'text_styles.dart';

//theme decoration class may contain all the decorations, text field decoration, containers decoration which will be reusable or used globally
class ThemeDecorations {
  static final ThemeDecorations _singleton = ThemeDecorations._internal();

  factory ThemeDecorations() => _singleton;

  ThemeDecorations._internal();

  TextStyles textStyles = TextStyles();

  ///==> Containers
  BoxShadow commonContainerBoxShadow() {
    return BoxShadow(
      blurStyle: BlurStyle.outer,
      color: AppColors().getTextColor.withOpacity(.2),
      spreadRadius: .1,
      blurRadius: 4,
    );
  }

  BoxShadow commonWorkoutPreviewBoxShadow() {
    return BoxShadow(
        color: Colors.black.withOpacity(.4),
        blurRadius: 2,
        spreadRadius: 0,);
  }
}
