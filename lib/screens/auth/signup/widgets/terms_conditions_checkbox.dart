


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_snap/controllers/signup/signup_controller.dart';
import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';

class PTermsAndConditionCheckbox extends StatelessWidget {
  const PTermsAndConditionCheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = PHelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(height: 24, width: 24, child:
        Obx( ()=> Checkbox(
            value: controller.privacyPolicy.value,
            onChanged: (value)=>controller.privacyPolicy.value = !controller.privacyPolicy.value),
        ),
        ),
        const SizedBox(width: PSizes.spaceBtwItems),
        Expanded(
          flex: 9,
          child: Text.rich(TextSpan(
            children: [
              TextSpan(text: '${PTextStrings.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall,),
              TextSpan(text: '${PTextStrings.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark? PColors.secondary: PColors.primary,
                decoration: TextDecoration.underline,
                decorationColor:  dark? PColors.secondary: PColors.primary,
              ),),

              TextSpan(text: '${PTextStrings.and} ', style: Theme.of(context).textTheme.bodySmall,),
              TextSpan(text: PTextStrings.termsOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark? PColors.secondary: PColors.primary,
                decoration: TextDecoration.underline,
                decorationColor:  dark? PColors.secondary: PColors.primary,
              ),),
            ],
          ),),
        ),

      ],
    );
  }
}