import 'package:advertisement_app/screens/auth/auth_controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../constants/app_spacer_constants.dart';
import '../widgets/location_update_top_text.dart';
import '../widgets/location_update_fields.dart';

Widget locationUpdateBody(
    {required BuildContext context, required AuthController authController}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      buildLocationUpdateTopText(context: context),
      const Expanded(child: SingleChildScrollView(child: ProfileFields())),

      ///location_save__Button
      ///location save
      Obx(() => buildSaveLocationButton(authController: authController)),
      AppSpacer.p12(),
    ],
  );
}
