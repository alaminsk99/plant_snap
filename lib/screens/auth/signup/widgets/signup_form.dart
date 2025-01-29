
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_snap/controllers/signup/signup_controller.dart';
import 'package:plant_snap/screens/auth/signup/widgets/terms_conditions_checkbox.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/validator/validators.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// First name & Last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value)=> PValidators.validateEmptyText('First name', value),
                  expands: false,
                  decoration:   const InputDecoration(labelText: PTextStrings.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox( width: PSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value)=> PValidators.validateEmptyText('Last name', value),
                  expands: false,
                  decoration:  const InputDecoration(labelText: PTextStrings.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),

            ],
          ),
          const SizedBox( height: PSizes.spaceBtwInputFields),
          /// User name
          TextFormField(
            controller: controller.username,
            validator: (value)=> PValidators.validateEmptyText('Username', value),
            expands: false,
            decoration:  const InputDecoration(labelText: PTextStrings.userName, prefixIcon: Icon(Iconsax.user_edit)),
          ),

          const SizedBox( height: PSizes.spaceBtwInputFields),
          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value)=> PValidators.validateEmail(value),
            expands: false,
            decoration:  const InputDecoration(labelText: PTextStrings.email, prefixIcon: Icon(Iconsax.direct)),
          ),


          const SizedBox( height: PSizes.spaceBtwInputFields),
          /// Password
          Obx(
              () => TextFormField(
              controller: controller.password,
              validator: (value)=> PValidators.validatePassword(value),
              obscureText: controller.hidePassword.value,
              expands: false,
              decoration:  InputDecoration(
                labelText: PTextStrings.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon:  Icon( controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
              ),
            ),
          ),

          const SizedBox( height: PSizes.spaceBtwInputFields),
          /// Trams & Condition with Check Box
          const PTermsAndConditionCheckbox(),

          const SizedBox( height: PSizes.spaceBtwInputFields),
          /// Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:()=> controller.signup(),
              child: const Text(PTextStrings.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}