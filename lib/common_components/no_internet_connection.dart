import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../common/tabView_text_widget.dart';
import '../constants/app_spacer_constants.dart';
import '../utils/app_utils/assets/assets_data.dart';
import '../utils/app_utils/string/strings.dart';

class NoInterNetConnectionView extends StatelessWidget {
  const NoInterNetConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            child: Center(
                child: Lottie.asset(Assets.lottieAnimationNoNetworkAnimation))),
        AppSpacer.p32(),
        TabViewTextWidget(
            color: Theme.of(context).colorScheme.shadow,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
            text: Strings.noInternet),
      ],
    );
  }
}
