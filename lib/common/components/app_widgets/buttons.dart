import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class BtnProperties {
  Size? size;
  double? textSize;
  Color? backgroundColor;

  BtnProperties({
    this.size,
    this.textSize,
    this.backgroundColor,
  });
}

class BtnElevated extends StatelessWidget {
  BtnElevated(
      {super.key,
      this.btnProperties,
      required this.onTap,
      required this.buttonText});

  final String buttonText;
  BtnProperties? btnProperties;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: btnProperties?.size,
        fixedSize: btnProperties?.size,
        backgroundColor:
            btnProperties?.backgroundColor ?? AppColors().getPrimaryColor,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
            fontSize: btnProperties?.textSize,
            color: AppColors().getOnPrimaryColor),
      ),
    );
  }
}

class BtnOutlined extends StatelessWidget {
  BtnOutlined(
      {super.key,
        this.btnProperties,
        required this.onTap,
        required this.buttonText});

  final String buttonText;
  BtnProperties? btnProperties;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        onTap();
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors().getPrimaryColor),
        minimumSize: btnProperties?.size,
        fixedSize: btnProperties?.size,
        backgroundColor:
        btnProperties?.backgroundColor ,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
            fontSize: btnProperties?.textSize,
            color: AppColors().getPrimaryColor),
      ),
    );
  }
}

class BtnIcon extends StatelessWidget {
  BtnIcon({
    super.key,
    required this.onTap,
    required this.icon,
    this.btnProperties,
  });

  BtnProperties? btnProperties;
  final Function onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onTap();
      },
      icon: icon,
      style: IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      constraints: BoxConstraints(
        maxHeight: btnProperties?.size?.height ?? double.infinity,
        maxWidth: btnProperties?.size?.width ?? double.infinity,
      ),
    );
  }
}
