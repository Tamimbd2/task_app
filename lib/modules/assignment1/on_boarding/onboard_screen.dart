import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/constants/app_colors.dart';
import '../../../widgets/button.dart';
import '../../../widgets/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/icon/onboarding.png",
      "title": "Best online courses in the world",
      "desc": "Now you can learn anywhere, anytime, even if there is no internet access!"
    },
    {
      "image": "assets/icon/onboarding2.png",
      "title": "Explore your new skill today",
      "desc": "Our platform is designed to help you explore new skills. Let’s learn & grow with Eduline!"
    },
  ];

  void _nextPage() {
    if (_currentPage == onboardingData.length - 1) {
      // Navigate to login or home screen
      Get.offAllNamed('/login');
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) {
                  final item = onboardingData[index];
                  return OnboardingContent(
                    imagePath: item['image']!,
                    title: item['title']!,
                    description: item['desc']!,
                  );
                },
              ),
            ),


            SmoothPageIndicator(
              controller: _pageController,
              count: onboardingData.length,
              effect: JumpingDotEffect(
                activeDotColor: AppColors.primary,
                dotColor: AppColors.lightGrey,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 6,
              ),
            ),

            const SizedBox(height: 24),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomButton1(
                text: _currentPage == onboardingData.length - 1
                    ? "Get Started"
                    : "Next",
                onPressed: _nextPage,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
