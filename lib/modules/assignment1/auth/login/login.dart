import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/text_edit_box.dart';
import '../../../../routes/app_routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _rememberMe = true;

  void _handleSignIn() {
    print('Sign In pressed');
    Get.toNamed('/enable-location');
  }

  void _handleCreateAccount() {
    print('Navigate to Create Account');
    Get.toNamed(AppRoutes.REGISTER);
  }

  void _handleForgotPassword() {
    print('Navigate to Forgot Password');
    Get.toNamed(AppRoutes.FORGOT_PASSWORD);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              // Logo
              Image.asset(
                'assets/icon/bulb 1.png',
                width: 80,
                height: 80,
              ),

              const SizedBox(height: 32),

              // Title
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              const Text(
                'Please login first to start your Theory Test.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Email Field
              const InputField(
                labelText: 'Email Address',
                hintText: 'pristia@gmail.com',
              ),

              const SizedBox(height: 20),

              // Password Field
              const InputField(
                labelText: 'Password',
                hintText: '••••••••',
                isPassword: true,
              ),

              const SizedBox(height: 16),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                        activeColor: Colors.blue.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const Text(
                        'Remember Me',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: _handleForgotPassword,
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Sign In Button
              CustomButton1(
                text: 'Sign In',
                onPressed: _handleSignIn,
                color: Colors.blue.shade600,
                textColor: Colors.white,
              ),

              const SizedBox(height: 16),

              // Create Account Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New to Theory Test? ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  TextButton(
                    onPressed: _handleCreateAccount,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
