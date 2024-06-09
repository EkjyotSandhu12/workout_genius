import 'package:flutter/material.dart';

import '../../app_widgets/inputs/my_input_text_field.dart';

class TextFieldWithTitle extends StatelessWidget {
  TextFieldWithTitle({super.key, required this.title, this.hintText, this.crossAxisAlignment, required this.textEditingController,});

  final String title;
  final String? hintText;
  final    CrossAxisAlignment? crossAxisAlignment;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Text(
          title,
        ),
        SizedBox(
          height: 16,
        ),
        MyInputTextField(

        ),
      ],
    );
  }
}
