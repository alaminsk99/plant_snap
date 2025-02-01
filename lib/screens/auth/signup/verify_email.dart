
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/common/widgets/success_screen/success_screen.dart';
import 'package:plant_snap/controllers/signup/verify_email_controller.dart';
import 'package:plant_snap/data/repositories/authentication/authentication_repository.dart';
import 'package:plant_snap/screens/auth/login/login_screen.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/constants/image_strings.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';


class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key,this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    final dark = PHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [

          IconButton(onPressed: ()=> AuthenticationRepository.instance.logout(), icon:  Icon(CupertinoIcons.clear, color: dark? PColors.secondary : PColors.black ,)),
          SizedBox(width: PSizes.md,),
        ],
      ),
      body: SingleChildScrollView(
        // Padding Give the Default Equal Space on all sides in all screen.
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: const AssetImage(PImageStrings.deliveredEmailIllustration), width: PHelperFunction.screenWidth() * 0.6,),
              const SizedBox( height: PSizes.spaceBtwSection),
              /// Title & SubTitle
              Text(PTextStrings.conformEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: PSizes.spaceBtwItems),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
              const SizedBox(height: PSizes.spaceBtwItems),
              Text(PTextStrings.conformEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: PSizes.spaceBtwSection),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()=> controller.checkEmailVerificationStatus(),
                  child: const Text(PTextStrings.pContinue),
                ),
              ),
              const SizedBox(height:PSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: ()=> controller.sendEmailVerification(),
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