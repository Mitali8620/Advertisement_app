import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../../common_components/app_base_widget.dart';
import '../../../../../config/routes/route_constants.dart';
import '../../../../../constants/auth_header.dart';
import '../../../../../utils/core/helpers/global_helper.dart';
import '../../../auth_controller/auth_controller.dart';
import 'responsive_view/sign_up_mobile_page.dart';
import 'responsive_view/sign_up_tablet_web_page.dart';

class SignUpMainScreen extends StatefulWidget {
  const SignUpMainScreen({super.key});

  @override
  State<SignUpMainScreen> createState() => _SignUpMainScreenState();
}

class _SignUpMainScreenState extends State<SignUpMainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authCubit) {
        return PopScope(
          canPop: true,
          onPopInvoked: (didPop) async {

          },
          child: AppBaseScaffold(
            appbar: AuthHeader(arrowOnTap: () async {
              print(
                  "------------------- back from login ------------------- **");
              await GlobalInit.navKey.currentState?.pushReplacementNamed(
                AppRoutes.onBoardingMainScreen,
              );
            }),
            child: ResponsiveBuilder(builder: (context, sizingInformation) {
              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.desktop) {
                return const SignUpTabletWebPage();
              }

              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.tablet) {
                return const SignUpTabletWebPage();
              }

              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.mobile) {
                return const SignUpMobilePage();
              }
              return const SizedBox.shrink();
            }),
          ),
        );
      },
    );
  }
}
