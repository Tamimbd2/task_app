import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/text_edit_box.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  void _handleSubmit() {
    print('Submit button pressed');
    Get.toNamed('/otp-verification');
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
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Subtitle
              Center(
                child: Text(
                  'Your password must be at least 8 characters\nlong and include a combination of letters,\nnumbers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textLight,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // New Password Field
              const InputField(
                labelText: 'New Password',
                hintText: '••••••••',
                isPassword: true,
              ),

              const SizedBox(height: 20),

              // Confirm New Password Field
              const InputField(
                labelText: 'Confirm New Password',
                hintText: '••••••••',
                isPassword: true,
              ),

              const SizedBox(height: 32),

              // Submit Button
              CustomButton1(
                text: 'Submit',
                onPressed: _handleSubmit,
                color: AppColors.primary,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}