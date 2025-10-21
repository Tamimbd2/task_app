import 'package:flutter/material.dart';
import 'package:technical_task/modules/assignment1/language/widegts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/button.dart';


class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage = 'English (US)';

  final List<Map<String, String>> languages = [
    {'name': 'English (US)', 'flag': 'assets/flag_icon/United States of America (US).png'},
    {'name': 'Indonesia', 'flag': 'assets/flag_icon/Indonesia (ID).png'},
    {'name': 'Afghanistan', 'flag': 'assets/flag_icon/Afghanistan.png'},
    {'name': 'Algeria', 'flag': 'assets/flag_icon/Algeria.png'},
    {'name': 'Malaysia', 'flag': 'assets/flag_icon/Malaysia.png'},
    {'name': 'Arabic', 'flag': 'assets/flag_icon/United Arab Emirates (AE).png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  CustomBackButton(onPressed: () => Navigator.of(context).pop()),

                  const SizedBox(height: 24),

                  // Title
                  const Text(
                    'What is Your Mother Language',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),

                  const SizedBox(height: 12),

                  // Description
                  Text(
                    'Discover what is a podcast description and podcast summary.',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600, height: 1.5),
                  ),
                ],
              ),
            ),

            // Language List Widget
            Expanded(
              child: LanguageSelectionWidget(
                languages: languages,
                selectedLanguage: selectedLanguage,
                onLanguageSelected: (language) {
                  setState(() {
                    selectedLanguage = language;
                  });
                },
              ),
            ),

            // Continue Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomButton1(
                text: 'Continue',
                onPressed: () {
                  print('Selected Language: $selectedLanguage');
                  // এখানে পরবর্তী স্ক্রিনে যাওয়ার কোড থাকবে
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
