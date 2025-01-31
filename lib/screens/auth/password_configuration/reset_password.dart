


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/controllers/forget_password/forget_password_controller.dart';
import 'package:plant_snap/screens/auth/login/login_screen.dart';
import 'package:plant_snap/utils/constants/image_strings.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.back(), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image:  const AssetImage(PImageStrings.deliveredEmailIllustration),
                width: PHelperFunction.screenWidth() * 0.6,
              ),
              const SizedBox(height: PSizes.spaceBtwSection),

              /// Email

              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: PSizes.spaceBtwItems),
              /// Title & SubTitle
              Text(
               PTextStrings.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: PSizes.spaceBtwItems),
              Text(
                PTextStrings.changeYourPasswordSubTitle ,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: PSizes.spaceBtwSection),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()=> Get.offAll(()=>LoginScreen()),
                  child: const Text(PTextStrings.done),
                ),
              ),
              const SizedBox(height: PSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: ()=> ForgetPasswordController.instance.resendPasswordResetEmail(email),
                  child: const Text(PTextStrings.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}