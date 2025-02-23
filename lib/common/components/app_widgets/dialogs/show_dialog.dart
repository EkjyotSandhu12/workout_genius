import 'package:flutter/material.dart';
import '../../../theme/design_metrics.dart';
import '../../../theme/text_styles.dart';
import '../buttons.dart';
import 'common_dialog_ui.dart';

class ShowDialog {
  showSimpleDialog(
      BuildContext context, {
        required String title,
        required String bodyText,
        required String buttonText,
        required Function onButtonTap,
      }) async {
    return await _commonShowDialog(
      context,
      CommonDialogUI(
        header: Text(
          title,
          style: TextStyles().getDialogTitleTextStyle,
          maxLines: 1,
        ),
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(DesignMetrics().getDialogRadius12),
          ),
          child: Text(
            bodyText,
            style: TextStyles().getDialogBodyTextStyle,
          ),
        ),
        footer: BtnElevated(
          onTap: () {
            onButtonTap();
          },
          buttonText: buttonText,),
      ),
    );
  }

  _commonShowDialog(BuildContext context, Widget widget) async {
    return await showDialog(
      context: context,
      builder: (context) => widget,
    );
  }
}
