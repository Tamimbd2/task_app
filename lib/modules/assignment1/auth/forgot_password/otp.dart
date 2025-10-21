import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'dart:async';
import '../../../../core/constants/app_colors.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/dialog.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({
    super.key,
    required this.email,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  int _resendTimer = 48;
  Timer? _timer;
  bool _isVerifying = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimer > 0) {
        setState(() {
          _resendTimer--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resendCode() {
    if (_resendTimer == 0) {
      setState(() {
        _resendTimer = 48;
        _pinController.clear();
      });
      _startTimer();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP code resent successfully')),
      );
    }
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  Future<void> _verifyOtp(String pin) async {
    if (pin.length != 4) {
      return;
    }

    setState(() {
      _isVerifying = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isVerifying = false;
    });

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomSuccessDialog(
        title: 'Success',
        message: 'Your password is successfully created',
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Custom theme for Pinput
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 0, // Hide text, show dots instead
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primary,
          width: 2,
        ),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.red.shade300,
          width: 1.5,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: CustomBackButton(
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),

              const SizedBox(height: 32),

              // Title
              const Text(
                'Verify Code',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 12),

              // Subtitle
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Please enter the code we just sent to\nemail ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: widget.email,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Pinput Widget
              Pinput(
                controller: _pinController,
                focusNode: _focusNode,
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                errorPinTheme: errorPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: false, // Cursor off - no blinking
                obscureText: true,
                obscuringWidget: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  _verifyOtp(pin);
                },
                onChanged: (value) {
                  setState(() {});
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                autofocus: true,
              ),

              const SizedBox(height: 40),

              // Resend Code
              GestureDetector(
                onTap: _resendCode,
                child: RichText(
                  text: TextSpan(
                    text: 'Resend code in ',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: _formatTime(_resendTimer),
                        style: TextStyle(
                          color: _resendTimer == 0
                              ? AppColors.primary
                              : Colors.grey.shade600,
                          fontWeight: _resendTimer == 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Loading indicator
              if (_isVerifying)
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}