import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/text_edit_box.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  void _handleContinue() {
    print('Continue button pressed');
    Get.toNamed(AppRoutes.RESET_PASSWORD);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              const CustomBackButton(),

              const SizedBox(height: 32),

              // Title
              const Center(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Subtitle
              Center(
                child: Text(
                  'Enter your email, we will send a\nverification code to email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Email Field
              const InputField(
                labelText: 'Email Address',
                hintText: 'pristia@gmail.com',
              ),

              const SizedBox(height: 32),

              // Continue Button
              CustomButton1(
                text: 'Continue',
                onPressed: _handleContinue,
                color: Colors.blue.shade600,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}