
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_snap/controllers/onboarding/onboarding_controller.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/device/device_utility.dart';



class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());

    return Positioned(
      right: PSizes.defaultSpace,
      bottom: PDeviceUtility.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: ()=> controller.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: PColors.primary,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}