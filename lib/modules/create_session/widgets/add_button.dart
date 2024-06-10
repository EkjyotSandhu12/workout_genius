import 'package:flutter/material.dart';
import 'package:workout_genius/common/components/app_widgets/buttons.dart';

import '../../../common/app_values/app_strings.dart';
import '../../../common/components/custom_widgets/clickable_widget_overlay.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_styles.dart';

class AddButton extends StatelessWidget {
   AddButton({
    super.key,
  });

  BtnProperties btnProperties = BtnProperties(size: Size(200, 40));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClickableWidgetOverlay(
          onTap: () {
          },
          borderRadius: BorderRadius.circular(100),
          widget: Container(
            height: 60,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    spreadRadius: .3,
                    blurRadius: 2),
              ],
              color: AppColors().getPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Text(
                AppStrings.add.toUpperCase(),
                style: TextStyles()
                    .getRubikTextStyle(fontSize: 13, fontWeight: VFontWeight.w500),
              ),
            ),
          ),
        ),

/*        BtnElevated(onTap: (){}, buttonText: 'Add Exercise',btnProperties: btnProperties, ),
        BtnElevated(onTap: (){}, buttonText: 'Add Super-set Exercise',btnProperties: btnProperties,),
        BtnElevated(onTap: (){}, buttonText: 'Add Drop-set Exercise', btnProperties: btnProperties,),*/

      ],
    );
  }
}


