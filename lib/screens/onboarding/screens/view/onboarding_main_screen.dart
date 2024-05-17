import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../common_components/app_base_widget.dart';
import '../../../../constants/auth_header.dart';
import 'responsive_view/onboarding_mobile_page.dart';
import 'responsive_view/onboarding_tablet_web_page.dart';

class OnBoardingMainScreen extends StatefulWidget {
  const OnBoardingMainScreen({super.key});

  @override
  State<OnBoardingMainScreen> createState() => _OnBoardingMainScreenState();
}

class _OnBoardingMainScreenState extends State<OnBoardingMainScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScaffold(
        appbar: const AuthHeader(),
        child: ResponsiveBuilder(builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return const OnBoardingTabletWebPage();
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return const OnBoardingTabletWebPage();
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
            return const OnboardingMobilePage();
          }
          return const SizedBox.shrink();
        }));
  }
}
