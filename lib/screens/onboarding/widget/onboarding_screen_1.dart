import 'package:flutter/material.dart';
import '../../../common/tabView_text_widget.dart';
import '../../../constants/app_spacer_constants.dart';
import '../../../utils/app_utils/assets/assets_data.dart';
import '../../../utils/app_utils/string/strings.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabViewTextWidget(
            color: Theme.of(context).colorScheme.shadow,
            fontSize: 30,
            maxLines: 2,
            fontWeight: FontWeight.w800,
            text: Strings.onBoardingTitle),
        AppSpacer.p8(),
        TabViewTextWidget(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.6),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            maxLines: 5,
            text: Strings.onBoardingDes),
        AppSpacer.p24(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(Assets.imagesOnboardingPicture),
        )),
      ],
    );
  }
}
