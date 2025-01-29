import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_snap/common/widgets/custom_text_field.dart';
import 'package:plant_snap/services/auth_service.dart';


class SignUpScreen extends StatelessWidget {
  final AuthService _authService = Get.find<AuthService>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Create an Account',
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                CustomTextField(
                  controller: _nameController,
                  label: 'Name',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _confirmPasswordController,
                  label: 'Confirm Password',
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _handleSignUp,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.green.shade600,
                  ),
                  child: const Text('Sign Up'),
                ),
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(color: Colors.green.shade600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignUp() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    try {
      await _authService.signUp(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      Get.back(); // Return to the Login screen
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
