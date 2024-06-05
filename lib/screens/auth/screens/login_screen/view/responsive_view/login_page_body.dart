import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../constants/app_spacer_constants.dart';
import '../../../../auth_controller/auth_controller.dart';
import '../../../component/login_fields.dart';
import '../../../component/login_widget_top_text.dart';

Widget logInPageBody(
    {required BuildContext context, required AuthController authController}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      buildLogInWidgetTopText(context: context),
      Expanded(
          child: SingleChildScrollView(
              child: LogInFields(authController: authController))),

      ///continue_login_Button
      ///button
      Obx(
        () => buildLoginButton(
          authController: authController,
        ),
      ),
      AppSpacer.p12(),
    ],
  );
}
