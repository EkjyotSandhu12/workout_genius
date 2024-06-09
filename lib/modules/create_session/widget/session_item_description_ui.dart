import 'package:flutter/material.dart';

import '../../../common/theme/text_styles.dart';

class SessionItemDescription extends StatelessWidget {
  const SessionItemDescription({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            children: [
              TextSpan(
                text: text,
              ),
              TextSpan(
                text: value,
                style: TextStyles().getRubikTextStyle(
                    fontSize: 15, fontWeight: VFontWeight.normal),
              ),
            ],
            style: TextStyles().getRubikTextStyle(
                fontSize: 13, fontWeight: VFontWeight.w300)));
  }
}
