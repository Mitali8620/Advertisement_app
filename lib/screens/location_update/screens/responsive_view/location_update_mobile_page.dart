import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../auth/auth_controller/auth_controller.dart';
import 'location_update_body.dart';

class LocationUpdateMobilePage extends StatelessWidget {
  LocationUpdateMobilePage({super.key});

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authCubit) {
        return const LocationUpdateBody();
      },
    );
  }
}
