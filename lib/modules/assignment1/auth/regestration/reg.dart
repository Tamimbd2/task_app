import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/dialog.dart';
import '../../../../widgets/text_edit_box.dart';



class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _passwordText = '';
  double _passwordStrength = 0.0;
  String _passwordStrengthText = '';
  Color _passwordStrengthColor = Colors.grey;
  bool _isPasswordValid = false;

  void _checkPasswordStrength(String password) {
    setState(() {
      _passwordText = password;

      if (password.isEmpty) {
        _passwordStrength = 0.0;
        _passwordStrengthText = '';
        _isPasswordValid = false;
        return;
      }

      int strength = 0;
      if (password.length >= 8) strength++;
      if (RegExp(r'[A-Z]').hasMatch(password)) strength++;
      if (RegExp(r'[a-z]').hasMatch(password)) strength++;
      if (RegExp(r'[0-9]').hasMatch(password)) strength++;

      _passwordStrength = strength / 3;

      bool hasMinLength = password.length >= 8;
      bool hasLetters = RegExp(r'[a-zA-Z]').hasMatch(password);
      bool hasNumbers = RegExp(r'[0-9]').hasMatch(password);

      _isPasswordValid = hasMinLength && hasLetters && hasNumbers;

      if (_passwordStrength <= 0.33) {
        _passwordStrengthText = 'Weak';
        _passwordStrengthColor = Colors.red;
      } else if (_passwordStrength <= 0.66) {
        _passwordStrengthText = 'Medium';
        _passwordStrengthColor = Colors.orange;
      } else {
        _passwordStrengthText = 'Strong';
        _passwordStrengthColor = Colors.green;
      }
    });
  }

  void _handleRegister() {
    // Show success dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomSuccessDialog(
        title: 'Successfully Registered',
        message: 'Your account has been registered successfully, now let\'s enjoy our features!',
        onPressed: () {
          Navigator.of(context).pop(); // Close dialog
          // Navigate to home or next screen
          // Get.toNamed(AppRoutes.HOME);
        },
      ),
    );
  }

  void _handleSignIn() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              const CustomBackButton(),

              const SizedBox(height: 32),

              // Title
              const Text(
                'Welcome to Eduline',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              const Text(
                'Let\'s join to Eduline learning ecosystem & meet our professional mentor. It\'s Free!',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 32),

              // Email Field
              const InputField(
                labelText: 'Email Address',
                hintText: 'pristia@gmail.com',
              ),

              const SizedBox(height: 20),

              // Full Name Field
              const InputField(
                labelText: 'Full Name',
                hintText: 'Pristia Candra',
              ),

              const SizedBox(height: 20),

              // Password Field with custom handling for strength
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    obscureText: true,
                    onChanged: _checkPasswordStrength,
                    style: const TextStyle(color: AppColors.textDark, fontSize: 16.0),
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 15.0,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: AppColors.lightGrey, width: 1.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: AppColors.lightGrey, width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Password Strength Indicator (Always Visible)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Strength Bar with 3 segments
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            // Segment 1
                            Expanded(
                              child: Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade600,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            // Segment 2
                            Expanded(
                              child: Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade600,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            // Segment 3
                            Expanded(
                              child: Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade600,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Strong',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 20,
                        color: Colors.green.shade600,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'At least 8 characters with a combination of letters and numbers',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.green.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Register Button
              CustomButton1(
                text: 'Register',
                onPressed: _handleRegister,
                color: Colors.blue.shade600,
                textColor: Colors.white,
              ),

              const SizedBox(height: 16),

              // Sign In Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  TextButton(
                    onPressed: _handleSignIn,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Sign In',
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