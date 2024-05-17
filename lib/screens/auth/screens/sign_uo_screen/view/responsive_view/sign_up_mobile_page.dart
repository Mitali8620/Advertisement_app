import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../auth_controller/auth_controller.dart';
import '../../sign_up_body.dart';

class SignUpMobilePage extends StatefulWidget {
  const SignUpMobilePage({super.key});

  @override
  State<SignUpMobilePage> createState() => _SignUpMobilePageState();
}

class _SignUpMobilePageState extends State<SignUpMobilePage> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return const SignUpBody();
  }
}
