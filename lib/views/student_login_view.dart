import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';

class StudentLoginView extends StatelessWidget {
  const StudentLoginView({super.key});
  static String id = "Student login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text(
          "Welcome back",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
