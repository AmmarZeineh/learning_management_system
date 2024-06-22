import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/category_view.dart';
import 'package:learning_management_system/views/welcome_view.dart';
//
class WelcomeButton extends StatelessWidget {
  const WelcomeButton({super.key, this.onTap, required this.activePage});
  final void Function()? onTap;
  final int activePage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: activePage == pages.length - 1
          ? () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CategoryView();
              }));
            }
          : onTap,
      child: Container(
        height: 40,
        width: 350,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: activePage == pages.length - 1
              ? const Text(
                  'Get Started',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              : const Text(
                  'Continue',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
