import 'package:flutter/material.dart';
import 'package:plant_snap/screens/auth/onboarding/widgets/OnBoardingPage.dart';
import 'package:plant_snap/screens/auth/onboarding/widgets/onboarding_next_button.dart';
import 'package:plant_snap/utils/constants/image_strings.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          //
          OnBoardingPage(image: PImageStrings.onBoarding, title: PTextStrings.onboardingTitle, subTitle: PTextStrings.onboardingSubTitle),
          // Circular Button

          OnBoardingNextButton(),
        ],
      ),
    );
  }
}
