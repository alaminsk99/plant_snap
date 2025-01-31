// lib/screens/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:plant_snap/common/widgets/custom_app_bar.dart';
import 'package:plant_snap/screens/auth/login/widgets/login_form.dart';
import 'package:plant_snap/screens/auth/login/widgets/login_header.dart';
import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: PTextStrings.appName),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(PSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: PSizes.spaceBtwItems,),
              LoginHeader(),
              SizedBox(height: PSizes.spaceBtwSection,),
              LoginForm(),

            ],
          ),
        ),
      ),
    );
  }

}