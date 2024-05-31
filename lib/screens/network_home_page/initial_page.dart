import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../common/tabView_text_widget.dart';
import '../../constants/app_spacer_constants.dart';
import '../../utils/app_utils/assets/assets_data.dart';

class InitiallyHomePage extends StatefulWidget {
  const InitiallyHomePage({super.key});

  @override
  State<InitiallyHomePage> createState() => _InitiallyHomePageState();
}

class _InitiallyHomePageState extends State<InitiallyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    print("------------------------ initially home page------------");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(Assets.someThingWentWrongJson),
        AppSpacer.p32(),
        TabViewTextWidget(
            color: Theme.of(context).colorScheme.shadow,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
            text: "Please refresh"),
      ],
    );
  }
}
