import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/app_spacer_constants.dart';
import '../../auth_controller/auth_controller.dart';
import '../component/sign_up_fields.dart';
import '../component/sign_up_widget_top_text.dart';

Widget signUpBody({required BuildContext context}) {
  return GetBuilder<AuthController>(builder: (authController) {
    authController. isSignUpLoading.value = false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///top text
        signUpWidgetTopText(context: context),

        ///center_field_widget

        Expanded(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [signUpFields(authController: authController)],
          ),
        )),

        ///continue_login_Button
        buildSignUpButton(authController: authController),
        AppSpacer.p12(),
      ],
    );
  });
}
