import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../widgets/button.dart';


class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(),


              Image.asset(
                'assets/icon/Maps.png',
                width: 120,
                height: 120,
              ),

              const SizedBox(height: 40),

              // Title
              const Text(
                'Enable Location',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 16),

              // Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Kindly allow us to access your location to provide you with suggestions for nearby salons',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Enable Button
              CustomButton1(
                text: 'Enable',
                onPressed: () {
                  Get.toNamed('/language-selection');
                },
              ),

              const SizedBox(height: 20),

              // Skip Button
              TextButton(
                onPressed: () {
                  // TODO: Navigate to next screen
                },
                child: const Text(
                  'Skip, Not Now',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}