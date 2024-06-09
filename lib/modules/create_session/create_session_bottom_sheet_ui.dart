import 'package:flutter/material.dart';
import 'package:workout_genius/common/app_values/app_strings.dart';
import 'package:workout_genius/common/theme/app_colors.dart';
import 'package:workout_genius/common/theme/text_styles.dart';
import 'package:workout_genius/common/utils/screen_utils.dart';

import 'modules/enter_session_name/enter_session_name_view.dart';

class CreateSessionBottomSheetUI extends StatelessWidget {
  const CreateSessionBottomSheetUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          EnterSessionNameUI(),
        ],
      ),
    );
  }
}
