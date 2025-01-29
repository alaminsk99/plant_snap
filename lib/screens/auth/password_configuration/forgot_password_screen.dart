import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_snap/common/widgets/custom_app_bar.dart';
import 'package:plant_snap/common/widgets/custom_text_field.dart';
import 'package:plant_snap/data/services/auth_service.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final AuthService _authService = Get.find<AuthService>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunction.isDarkMode(context);
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
              TextFormField(
                decoration: const  InputDecoration(labelText: PTextStrings.email,prefixIcon: Icon(Iconsax.direct_right)),
              ),
              const SizedBox(height: PSizes.spaceBtwSection),
              SizedBox(width: double.infinity ,child: ElevatedButton(onPressed: (){}, child: const Text(PTextStrings.submit))),
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

  Future<void> _handleForgotPassword() async {
    try {
      await _authService.sendPasswordResetEmail(_emailController.text);
      Get.snackbar('Success', 'Password reset email sent');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
