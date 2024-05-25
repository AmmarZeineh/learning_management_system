import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/student_choose_view.dart';
import 'package:learning_management_system/views/student_login_view.dart';
import 'package:learning_management_system/views/welcome_view.dart';

void main() {
  runApp(const LearningManagementSystem());
}

class LearningManagementSystem extends StatelessWidget {
  const LearningManagementSystem({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeView.id,
      routes: {
        WelcomeView.id: (context) => const WelcomeView(),
        StudentChooseView.id: (context) => const StudentChooseView(),
        StudentLoginView.id: (context) => const StudentLoginView(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins', scaffoldBackgroundColor: primaryColor),
      home: const WelcomeView(),
    );
  }
}
