import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomSearchCard extends StatelessWidget {
  const CustomSearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/images/online_learning.svg",
              width: 80,
              height: 80,
            ),
            Column(children: [
              const Text(
                "Flutter master",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "learn flutter form zero to hero",
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            ]),
            IconButton(
              icon: Icon(Icons.arrow_circle_right),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}