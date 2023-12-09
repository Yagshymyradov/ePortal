import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Color? textColor;
  final Color backgroundColor;
  final Color? borderColor;

  const SmallButton({
    super.key,
    this.onTap,
    required this.title,
    this.textColor,
    required this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 37,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
