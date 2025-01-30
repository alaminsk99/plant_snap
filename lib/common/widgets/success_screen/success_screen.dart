

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_snap/common/styles/spacing_styles.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image,title,subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Lottie Image
              Lottie.asset(image,width: PHelperFunction.screenWidth() * 0.6,),
              const SizedBox(height: PSizes.spaceBtwSection),

              /// Title & SubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: PSizes.spaceBtwItems),
              Text(
                subTitle ,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: PSizes.spaceBtwSection),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(PTextStrings.pContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}