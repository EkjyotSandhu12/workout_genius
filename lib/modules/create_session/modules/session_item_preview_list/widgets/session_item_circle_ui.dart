import 'package:flutter/material.dart';

import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/theme/text_styles.dart';

class SessionItemCircleUI extends StatelessWidget {
  const SessionItemCircleUI({
    super.key,
    required this.centerText,
    this.size = 90,
  });

  final String centerText;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      alignment: Alignment.center,
      child: Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors().getPrimaryColor,
        ),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(7),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Text(
            centerText,
            style: TextStyles().getRubikTextStyle(fontSize: 13),
          ),
        ),
      ),
    );
  }
}
