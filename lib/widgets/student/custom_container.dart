import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 300,
        height: 40,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
