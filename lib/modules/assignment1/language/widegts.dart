import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class LanguageSelectionWidget extends StatelessWidget {
  final List<Map<String, String>> languages;
  final String? selectedLanguage;
  final ValueChanged<String> onLanguageSelected;

  const LanguageSelectionWidget({
    Key? key,
    required this.languages,
    required this.selectedLanguage,
    required this.onLanguageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemCount: languages.length,
      itemBuilder: (context, index) {
        final language = languages[index];
        final isSelected = selectedLanguage == language['name'];

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade200, width: 1),
              ),
              child: ClipOval(
                child: Image.asset(
                  language['flag']!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade300,
                      child: Icon(Icons.flag, color: Colors.grey.shade600, size: 20),
                    );
                  },
                ),
              ),
            ),
            title: Text(
              language['name']!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            trailing: isSelected
                ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.check, color: Colors.white, size: 18),
                  SizedBox(width: 6),
                  Text(
                    'Selected',
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
                : Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: Text(
                'Select',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            onTap: () {
              onLanguageSelected(language['name']!);
            },
          ),
        );
      },
    );
  }
}
