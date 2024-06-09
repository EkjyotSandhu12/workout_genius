import 'package:flutter/material.dart';
import 'package:workout_genius/common/components/app_widgets/inputs/my_input_text_field.dart';
import 'package:workout_genius/common/theme/design_metrics.dart';
import '../../../common/app_values/app_strings.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_styles.dart';

class EnterSessionNameUI extends StatelessWidget {
  EnterSessionNameUI({
    super.key,
    required this.sessionNameController,
  });

  TextEditingController sessionNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors().getPrimaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
            DesignMetrics().getCommonRadius24,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQueryData.fromView(View.of(context)).padding.top,
          ),
          AppBar(
            backgroundColor: AppColors().getPrimaryColor,
            foregroundColor: AppColors().getOnPrimaryColor,
            title: Text(
              AppStrings.createWorkoutSession,
              style: TextStyles().getAppBarTextStyle.copyWith(
                    color: AppColors().getOnPrimaryColor,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
            child: MyInputTextField(
              textEditingController: sessionNameController,
              hintText: AppStrings.enterYourSessionName,
            ),
          ),
        ],
      ),
    );
  }
}
