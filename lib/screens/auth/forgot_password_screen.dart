import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_snap/common/widgets/custom_text_field.dart';
import 'package:plant_snap/services/auth_service.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final AuthService _authService = Get.find<AuthService>();
  final TextEditingController _emailController = TextEditingController();

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
                'Forgot Password',
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
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _handleForgotPassword,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green.shade600,
                ),
                child: const Text('Reset Password'),
              ),
              TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  'Back to Login',
                  style: TextStyle(color: Colors.green.shade600),
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
