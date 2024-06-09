import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../auth/auth_controller/auth_controller.dart';
import 'location_update_body.dart';

class LocationUpdateMobilePage extends StatelessWidget {
  const LocationUpdateMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return locationUpdateBody(
            context: context, authController: authController);
      },
    );
  }
}
