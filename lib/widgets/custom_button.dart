import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    this.onTap,
    required this.title,
  });
  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 350,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: primaryColor, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
