import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomCourseCard extends StatelessWidget {
  const CustomCourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Card(
        elevation: 12,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/images/undraw_business_chat_re_gg4h.svg",
                width: 80,
                height: 80,
              ),
              Column(
                children: [
                  const Text(
                    "Flutter master",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "learn flutter form zero to hero",
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}