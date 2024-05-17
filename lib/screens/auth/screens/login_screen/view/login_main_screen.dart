import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../../common_components/app_base_widget.dart';
import '../../../../../config/routes/route_constants.dart';
import '../../../../../constants/auth_header.dart';
import '../../../../../utils/core/helpers/global_helper.dart';
import '../../../auth_controller/auth_controller.dart';
import 'responsive_view/login_mobile_page.dart';
import 'responsive_view/login_tablet_web_page.dart';

class LogInMainScreen extends StatefulWidget {
  const LogInMainScreen({super.key});

  @override
  State<LogInMainScreen> createState() => _LogInMainScreenState();
}

class _LogInMainScreenState extends State<LogInMainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authCubit) {
        return PopScope(
          canPop: true,
          onPopInvoked: (didPop) async {},
          child: AppBaseScaffold(appbar: AuthHeader(arrowOnTap: () async {
            print("------------------- back from login ------------------- **");
            await GlobalInit.navKey.currentState?.pushReplacementNamed(
              AppRoutes.onBoardingMainScreen,
            );
          }), child: ResponsiveBuilder(builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType ==
                DeviceScreenType.desktop) {
              return const LogInTabLetWebPage();
            }

            if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
              return const LogInTabLetWebPage();
            }

            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
              return const LoginMobilePage();
            }
            return const SizedBox.shrink();
          })),
        );
      },
    );
  }
}
