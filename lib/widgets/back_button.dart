import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  const CustomBackButton({
    super.key,
    this.onPressed,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.size = 48,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: iconColor,
          size: iconSize,
        ),
        onPressed: onPressed ?? () => Navigator.of(context).pop(),
        padding: EdgeInsets.zero,
      ),
    );
  }
}