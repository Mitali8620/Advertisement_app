import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../../utils/app_utils/colors/app_colors.dart';
import '../../../../auth_controller/auth_controller.dart';
import '../../sign_up_body.dart';

class SignUpTabletWebPage extends StatefulWidget {
  const SignUpTabletWebPage({super.key});

  @override
  State<SignUpTabletWebPage> createState() => _SignUpTabletWebPageState();
}

class _SignUpTabletWebPageState extends State<SignUpTabletWebPage> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: AppTheme.white),
        child: ResponsiveBuilder(builder: (context, sizingInformation) {
          double size = MediaQuery.of(context).size.width * 0.5;
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            size = 700;
          } else if (sizingInformation.deviceScreenType ==
              DeviceScreenType.tablet) {
            size = MediaQuery.of(context).size.width * 0.7;
          } else if (sizingInformation.deviceScreenType ==
              DeviceScreenType.mobile) {
            size = MediaQuery.of(context).size.width;
          }
          return Center(
            child: SizedBox(
                width: size,
                child: Card(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: SignUpBody(),
                    ))),
          );
        }));
  }
}
