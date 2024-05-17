import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_components/app_elevated_button.dart';
import '../../../constants/app_spacer_constants.dart';
import '../../../config/routes/route_constants.dart';
import '../../../utils/app_utils/colors/app_colors.dart';
import '../../../utils/app_utils/string/strings.dart';
import '../../../utils/core/helpers/global_helper.dart';
import '../controller/on_boarding_controller.dart';
import 'onboarding_screen_1.dart';

class OnBoardingScreenView extends StatefulWidget {
  const OnBoardingScreenView({super.key});

  @override
  State<OnBoardingScreenView> createState() => _OnBoardingScreenViewState();
}

class _OnBoardingScreenViewState extends State<OnBoardingScreenView> {
  OnBoardingController onBoardingController = Get.put(OnBoardingController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (onBoardingController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                controller: onBoardingController.pageController,
                onPageChanged: (index) {
                  onBoardingController.updateIndex(index);
                },
                itemBuilder: (context, index) {
                  return const OnBoardingScreen1();
                },
              ),
            ),
            AppSpacer.p16(),
            SizedBox(
              height: 7,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return index == onBoardingController.selectedIndex
                      ? indicator(true)
                      : indicator(false);
                },
              ),
            ),
            AppSpacer.p24(),
            AppElevatedButton(
              title: Strings.signUp,
              onPressed: () {
                GlobalInit.navKey.currentState
                    ?.pushNamed(AppRoutes.signUpMainScreen);
              },
            ),
            AppSpacer.p8(),
            AppElevatedButton(
              title: Strings.login,
              backGroundColor: Theme.of(context).colorScheme.onError,
              onPressed: () {
                GlobalInit.navKey.currentState?.pushNamed(
                  AppRoutes.logInMainScreen,
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget indicator(bool isActive) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        width: isActive ? 13 : 8.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isActive ? 10 : 100),
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : AppTheme.greyBackGroundColor,
        ),
      ),
    );
  }
}
