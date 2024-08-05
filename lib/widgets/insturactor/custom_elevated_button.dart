import 'package:flutter/material.dart';
import 'package:learning_management_system/models/course_model.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.courseModel,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.textColor});

  final CourseModel courseModel;
  final void Function()? onPressed;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          fixedSize: const Size(170, 60),
          backgroundColor: color),
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor, fontSize: 18),
      ),
    );
  }
}
