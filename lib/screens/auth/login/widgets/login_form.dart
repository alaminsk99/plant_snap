import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_snap/screens/auth/password_configuration/forgot_password_screen.dart';
import 'package:plant_snap/screens/auth/signup/sign_up_screen.dart';
import 'package:plant_snap/screens/home_screen.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunction.isDarkMode(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: PSizes.spaceBtwSection),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: PTextStrings.email,
              ),
            ),
            const SizedBox(height: PSizes.spaceBtwInputFields,),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: PTextStrings.password,
                  suffixIcon: Icon(Iconsax.eye_slash)
              ),
            ),
            const SizedBox(height: PSizes.spaceBtwInputFields/2),
            /// Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value){}),
                    const Text(PTextStrings.rememberMe),
                  ],
                ),
                /// Forgot Password
                TextButton(onPressed: () => Get.to(()=>  ForgotPasswordScreen()), child: const Text(PTextStrings.forgetPassword)),
              ],
            ),
            const SizedBox(height: PSizes.spaceBtwSection),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){},
                child:  const Text(PTextStrings.signIn,style: TextStyle(color: PColors.secondary, fontSize: 18),),
              ),
            ),
            const SizedBox(height: PSizes.spaceBtwItems),
            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: ()=> Get.to(()=>  SignUpScreen()),
                child: const Text(PTextStrings.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }


}


