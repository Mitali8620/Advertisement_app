import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../constants/app_spacer_constants.dart';
import '../../../../auth_controller/auth_controller.dart';
import '../../../component/login_fields.dart';
import '../../../component/login_widget_top_text.dart';

class LogInPageBody extends StatefulWidget {
  const LogInPageBody({super.key});

  @override
  State<LogInPageBody> createState() => _LogInPageBodyState();
}

class _LogInPageBodyState extends State<LogInPageBody> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildLogInWidgetTopText(context: context),
        const Expanded(child: SingleChildScrollView(child: LogInFields())),

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
}
