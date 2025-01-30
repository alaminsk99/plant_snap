

import 'package:flutter/material.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subTitle,

  });

  final String image,title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: PHelperFunction.screenWidth() * 0.8,
            height: PHelperFunction.screenHeight() * 0.6,
            image:  AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
           const SizedBox(height:PSizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}