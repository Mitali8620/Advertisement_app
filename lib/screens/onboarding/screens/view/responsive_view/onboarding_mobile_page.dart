import 'package:flutter/material.dart';

import '../../../widget/onboarding_view.dart';

class OnboardingMobilePage extends StatefulWidget {
  const OnboardingMobilePage({super.key});

  @override
  State<OnboardingMobilePage> createState() => _OnboardingMobilePageState();
}

class _OnboardingMobilePageState extends State<OnboardingMobilePage> {
  @override
  Widget build(BuildContext context) {
    return const OnBoardingScreenView();
  }
}
