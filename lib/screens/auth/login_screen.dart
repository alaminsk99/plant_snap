// lib/screens/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_snap/common/widgets/custom_text_field.dart';
import 'package:plant_snap/screens/auth/sign_up_screen.dart';
import 'package:plant_snap/screens/home_screen.dart';
import 'package:plant_snap/services/auth_service.dart';
import 'package:plant_snap/services/plant_identification_service.dart';


class LoginScreen extends StatelessWidget {
  final AuthService _authService = Get.find<AuthService>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome Back',
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              CustomTextField(
                controller: _emailController,
                label: 'Email',
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                label: 'Password',
                prefixIcon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _handleLogin,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green.shade600,
                ),
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () => Get.to(() => SignUpScreen()),
                child: Text(
                  'Create an account',
                  style: TextStyle(color: Colors.green.shade600),
                ),
              ),
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