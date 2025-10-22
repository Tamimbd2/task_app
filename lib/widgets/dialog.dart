import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/app_colors.dart';
import 'button.dart';

class CustomSuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onPressed;
  final String successImagePath; // Required parameter
  final String buttonText; // Required parameter

  const CustomSuccessDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onPressed,
    required this.successImagePath, // Must provide image path
    required this.buttonText, // Must provide button text
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Main success image
                      Image.asset(
                        successImagePath,
                        height: 150,
                        fit: BoxFit.contain,
                      ),

                      // Top Left Star
                      Positioned(
                        top: 10,
                        left: 0,
                        child: Image.asset(
                          'assets/icon/Star 4.png',
                          width: 20,
                          height: 20,
                        ),
                      ),

                      // Top Right Star
                      Positioned(
                        top: 10,
                        right: 30,
                        child: Image.asset(
                          'assets/icon/Star 5.png',
                          width: 16,
                          height: 16,
                        ),
                      ),

                      // Middle Right Star
                      Positioned(
                        top: 80,
                        right: 10,
                        child: Image.asset(
                          'assets/icon/Star 6.png',
                          width: 22,
                          height: 22,
                        ),
                      ),

                      // Bottom Left Star
                      Positioned(
                        bottom: 10,
                        left: 30,
                        child: Image.asset(
                          'assets/icon/Star 8.png',
                          width: 18,
                          height: 18,
                        ),
                      ),

                      // Bottom Right Star
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: Image.asset(
                          'assets/icon/Star 3.png',
                          width: 14,
                          height: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Title
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // Message
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 24),

                // Continue Button
                CustomButton1(
                  text: buttonText,
                  onPressed: () {
                    onPressed();
                    Get.offAllNamed('/login');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}