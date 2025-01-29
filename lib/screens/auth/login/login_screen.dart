// lib/screens/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_snap/common/widgets/custom_app_bar.dart';
import 'package:plant_snap/common/widgets/custom_text_field.dart';
import 'package:plant_snap/data/services/auth_service.dart';
import 'package:plant_snap/data/services/plant_identification_service.dart';
import 'package:plant_snap/screens/auth/login/widgets/login_form.dart';
import 'package:plant_snap/screens/auth/login/widgets/login_header.dart';
import 'package:plant_snap/screens/auth/signup/sign_up_screen.dart';
import 'package:plant_snap/screens/home_screen.dart';

import 'package:plant_snap/utils/constants/sizes.dart';
import 'package:plant_snap/utils/constants/text_strings.dart';


class LoginScreen extends StatelessWidget {
  final AuthService _authService = Get.find<AuthService>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

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

  Future<void> _handleLogin() async {
    try {
      await _authService.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
      final plantService = Get.find<PlantIdentificationService>();
      Get.offAll(() => HomeScreen(plantService: plantService,));
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}