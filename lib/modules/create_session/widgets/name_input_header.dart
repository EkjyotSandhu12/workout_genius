import 'package:flutter/material.dart';
import 'package:workout_genius/common/components/app_widgets/buttons.dart';
import 'package:workout_genius/common/components/app_widgets/inputs/my_input_text_field.dart';
import 'package:workout_genius/common/route/route_service.dart';
import 'package:workout_genius/common/theme/design_metrics.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_styles.dart';

class AppBarButton {
  late String buttonText;
  late VoidCallback onTap;

  AppBarButton({required this.buttonText, required this.onTap});
}

class NameInputHeaderAppBar extends StatelessWidget {
  NameInputHeaderAppBar({
    super.key,
    required this.textController,
    required this.textFieldHintText,
    required this.appBarText,
    this.onBackButtonOverride,
    this.appBarButton,
  });

  final TextEditingController textController;
  final String textFieldHintText;
  final String appBarText;
  final VoidCallback? onBackButtonOverride;
  final AppBarButton? appBarButton;

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
            surfaceTintColor: AppColors().getPrimaryColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                if (onBackButtonOverride != null) {
                  onBackButtonOverride!();
                } else {
                  RouteService().pop();
                }
              },
            ),
            title: Row(
              children: [
                Text(
                  appBarText,
                  style: TextStyles().getAppBarTextStyle.copyWith(
                        color: AppColors().getOnPrimaryColor,
                      ),
                ),
                const Spacer(),
                if (appBarButton != null)
                  BtnOutlined(
                    onTap: appBarButton!.onTap,
                    buttonText: appBarButton!.buttonText,
                    btnProperties: BtnProperties(
                      size: const Size(140, 44),
                      backgroundColor: AppColors().getOnPrimaryColor,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14, top: 8),
            child: MyInputTextField(
              textEditingController: textController,
              hintText: textFieldHintText,
            ),
          ),
        ],
      ),
    );
  }
}
