import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_snap/common/widgets/custom_app_bar.dart';
import 'package:plant_snap/common/widgets/custom_text_field.dart';
import 'package:plant_snap/controllers/forget_password/forget_password_controller.dart';
import 'package:plant_snap/data/services/auth_service.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';
import 'package:plant_snap/utils/validator/validators.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunction.isDarkMode(context);
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: CustomAppBar(title: '',iconThemeData: IconThemeData(color: dark ? PColors.secondary: PColors.black,),isLeadingIcon: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Headings
              Text(PTextStrings.forgetPassword,style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: PSizes.spaceBtwItems),
              Text(PTextStrings.forgetScreenTitle,style: Theme.of(context).textTheme.labelMedium,),
              const SizedBox(height: PSizes.spaceBtwSection*2),
              // Text field
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator:(value) => PValidators.validateEmail(value),
                  decoration: const  InputDecoration(labelText: PTextStrings.email,prefixIcon: Icon(Iconsax.direct_right)),
                ),
              ),
              const SizedBox(height: PSizes.spaceBtwSection),
              SizedBox(width: double.infinity ,child: ElevatedButton(onPressed: ()=>controller.sendPasswordResetEmail(), child: const Text(PTextStrings.submit))),
              const SizedBox(height: PSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    'Back to Login',
                    style: TextStyle(color: Colors.green.shade600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
