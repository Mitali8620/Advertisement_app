import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../../../utils/app_utils/colors/app_colors.dart';
import '../../../../auth_controller/auth_controller.dart';
import 'login_page_body.dart';

class LogInTabLetWebPage extends StatefulWidget {
  const LogInTabLetWebPage({super.key});

  @override
  State<LogInTabLetWebPage> createState() => _LogInTabLetWebPageState();
}

class _LogInTabLetWebPageState extends State<LogInTabLetWebPage> {
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authCubit) {
        return Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: AppTheme.white),
          child: ResponsiveBuilder(builder: (context, sizingInformation) {
            double size = MediaQuery.of(context).size.width * 0.5;
            if (sizingInformation.deviceScreenType ==
                DeviceScreenType.desktop) {
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
                  elevation: 10,
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: logInPageBody(context: context,authController: authCubit),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
