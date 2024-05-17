import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../auth_controller/auth_controller.dart';
import 'login_page_body.dart';

class LoginMobilePage extends StatefulWidget {
  const LoginMobilePage({super.key});

  @override
  State<LoginMobilePage> createState() => _LoginMobilePageState();
}

class _LoginMobilePageState extends State<LoginMobilePage> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authCubit) {
        return LogInPageBody();
      },
    );
  }
}
