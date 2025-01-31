import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_snap/controllers/login/login_controller.dart';
import 'package:plant_snap/screens/auth/password_configuration/forgot_password_screen.dart';
import 'package:plant_snap/screens/auth/signup/sign_up_screen.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';
import 'package:plant_snap/utils/validator/validators.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: PSizes.spaceBtwSection),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value)=> PValidators.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: PTextStrings.email,
              ),
            ),
            const SizedBox(height: PSizes.spaceBtwInputFields,),
            Obx(
              ()=> TextFormField(
                controller: controller.password,
                validator: (value)=> PValidators.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration:  InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: PTextStrings.password,
                    suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash: Iconsax.eye),

                  ),
                ),
              ),
            ),
            const SizedBox(height: PSizes.spaceBtwInputFields/2),
            /// Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Obx(
                    ()=> Row(
                    children: [
                      Checkbox(value: controller.rememberMe.value, onChanged: (value)=> controller.rememberMe.value = !controller.rememberMe.value),
                      const Text(PTextStrings.rememberMe),
                    ],
                  ),
                ),
                /// Forgot Password
                TextButton(onPressed: () => Get.to(()=>  const ForgotPasswordScreen()), child: const Text(PTextStrings.forgetPassword)),
              ],
            ),
            const SizedBox(height: PSizes.spaceBtwSection),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=> controller.emailAndPasswordSignIn(),
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


