import 'package:flutter/material.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({
    super.key,
    required this.title,
    required this.subTitle,
    this.onPressed,
  });

  final String title;
  final String subTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title : ',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Expanded(
          child: Text(
            subTitle,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        IconButton(onPressed: onPressed, icon: const Icon(Icons.edit))
      ],
    );
  }
}
