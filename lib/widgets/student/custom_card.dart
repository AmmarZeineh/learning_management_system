import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/online_learning.svg',
            height: 100,
          ),
          Container(
            height: 50,
            width: 150,
            decoration: const BoxDecoration(
              color: Color(0xff7183BE),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
