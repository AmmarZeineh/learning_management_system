import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/insturctor_login_view.dart';
import 'package:learning_management_system/views/insturctor_choose_view.dart';
import 'package:learning_management_system/views/student_forget_password_view.dart';
import 'package:learning_management_system/views/student_choose_view.dart';
import 'package:learning_management_system/views/student_login_view.dart';
import 'package:learning_management_system/views/student_reset_password_view.dart';
import 'package:learning_management_system/views/student_signup.dart';
import 'package:learning_management_system/views/student_verfiy_view.dart';
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
        InsturctorChooseView.id: (context) => const InsturctorChooseView(),
        InsturctorLoginView.id: (context) => const InsturctorLoginView(),
        StudentChooseView.id: (context) => const StudentChooseView(),
        StudentLoginView.id: (context) => const StudentLoginView(),
        StudentSignupView.id: (context) => const StudentSignupView(),
        StudentForgetPasswordView.id: (context) =>
            const StudentForgetPasswordView(),
        StudentVerfiyView.id: (context) => const StudentVerfiyView(),
        StudentResetPasswordView.id: (context) =>
            const StudentResetPasswordView()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins', scaffoldBackgroundColor: primaryColor),
      home: const WelcomeView(),
    );
  }
}
