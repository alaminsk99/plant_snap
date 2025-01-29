import 'package:flutter/material.dart';
import 'package:plant_snap/common/widgets/custom_app_bar.dart';
import 'package:plant_snap/screens/auth/signup/widgets/signup_form.dart';

import 'package:plant_snap/utils/constants/colors.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';
import 'package:plant_snap/utils/helpers/helper_function.dart';


class SignUpScreen extends StatelessWidget {

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(title: '',
        isCenterTitle: false,
        isLeadingIcon: true,
        iconThemeData: IconThemeData(
            color: dark ? PColors.secondary : PColors.black),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(PSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Signup Title
                Text(PTextStrings.signupTitle, style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,),
                const SizedBox(height: PSizes.spaceBtwSection),
                const SignupForm(),

              ],
            ),
          ),
        ),
      ),
    );
  }

}