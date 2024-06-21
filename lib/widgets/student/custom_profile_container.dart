import 'package:flutter/material.dart';

class CustomProfileContainer extends StatelessWidget {
  const CustomProfileContainer(
      {super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        height: 70,
        width: 350,
        child: Card(
          elevation: 10,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(icon),
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}