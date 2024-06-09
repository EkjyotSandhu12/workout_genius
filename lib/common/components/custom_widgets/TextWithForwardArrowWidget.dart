import 'package:flutter/material.dart';

class TextWithForwardArrowWidget extends StatelessWidget {
  final String text;
  final Color? textColor;

  const TextWithForwardArrowWidget({
    super.key,
    required this.text,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
        ),
        const SizedBox(
          width: 6,
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        )
      ],
    );
  }
}
