import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/app_spacer_constants.dart';
import '../../auth_controller/auth_controller.dart';
import '../component/sign_up_fields.dart';
import '../component/sign_up_widget_top_text.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///top text
            signUpWidgetTopText(context: context),

            ///center_field_widget

            const Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [SignUpFields()],
              ),
            )),

            ///continue_login_Button
            buildSignUpButton(authController: authController),
            AppSpacer.p12(),
          ],
        );
      }
    );
  }
}
