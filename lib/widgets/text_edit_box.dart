
import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class InputField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool isPassword;

  const InputField({
    super.key,
    this.labelText,
    this.hintText,
    this.isPassword = false,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool _isObscured;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Define the common border style
  static const OutlineInputBorder customBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
    borderSide: BorderSide(color: AppColors.lightGrey, width: 1.0),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              widget.labelText!,
              style: const TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        TextField(
          controller: _controller,

          // --- Password Specific Logic ---
          obscureText: _isObscured,

          style: const TextStyle(color: AppColors.textDark, fontSize: 16.0),

          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 15.0,
            ),

            border: customBorder,
            enabledBorder: customBorder,
            focusedBorder: customBorder.copyWith(
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),

            fillColor: Colors.white,
            filled: true,

            // --- Suffix Icon (Password Toggle) ---
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                // Toggle the state to show/hide password
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            )
                : null, // No suffix icon for regular fields
          ),
        ),
      ],
    );
  }
}
