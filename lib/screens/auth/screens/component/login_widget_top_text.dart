import 'package:flutter/material.dart';

import '../../../../common/tabView_text_widget.dart';
import '../../../../constants/app_spacer_constants.dart';
import '../../../../utils/app_utils/string/strings.dart';

Widget buildLogInWidgetTopText({required BuildContext context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      TabViewTextWidget(
          color: Theme.of(context).colorScheme.shadow,
          fontSize: 30,
          fontWeight: FontWeight.w800,
          text: Strings.login),
      AppSpacer.p8(),
      TabViewTextWidget(
          color: Theme.of(context).colorScheme.shadow.withOpacity(0.6),
          fontSize: 16,
          maxLines: 2,
          fontWeight: FontWeight.w400,
          text: Strings.loginDes),
      AppSpacer.p48(),
    ],
  );
}
