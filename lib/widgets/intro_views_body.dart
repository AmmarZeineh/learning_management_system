import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class IntroViewsBody extends StatelessWidget {
  const IntroViewsBody(
      {super.key,
      required this.image,
      required this.title,
      required this.text1,
      required this.text2});
  final String image;
  final String title;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          SvgPicture.asset(
            image,
            height: 220,
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.sizeOf(context).width,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            text1,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            text2,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
