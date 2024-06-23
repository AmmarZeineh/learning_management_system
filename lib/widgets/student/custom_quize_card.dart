import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomQuizeCard extends StatelessWidget {
  const CustomQuizeCard({super.key});

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
              const Text(
                "Flutter Quize",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}