import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/Student_home_view.dart';
import 'package:learning_management_system/views/instructor_forget_password_view.dart';
import 'package:learning_management_system/views/instructor_reset_password_view.dart';
import 'package:learning_management_system/views/instructor_signup.dart';
import 'package:learning_management_system/views/instructor_verfiy_view.dart';
import 'package:learning_management_system/views/instructor_login_view.dart';
import 'package:learning_management_system/views/instructor_choose_view.dart';
import 'package:learning_management_system/views/student_choose_view.dart';
import 'package:learning_management_system/views/student_forget_password_view.dart';
import 'package:learning_management_system/views/student_login_view.dart';
import 'package:learning_management_system/views/student_reset_password_success_view.dart';
import 'package:learning_management_system/views/student_reset_password_view.dart';
import 'package:learning_management_system/views/student_search_view.dart';
import 'package:learning_management_system/views/student_signup.dart';
import 'package:learning_management_system/views/student_verfiy_view.dart';

import 'package:learning_management_system/views/welcome_view.dart';

void main() {
  runApp(const LearningManagementSystem());
}
enum SelectedTab { home, favorite, add, search, person }

class LearningManagementSystem extends StatelessWidget {
  const LearningManagementSystem({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeView.id,
      routes: {
        WelcomeView.id: (context) => const WelcomeView(),
        InstructorChooseView.id: (context) => const InstructorChooseView(),
        InstructorLoginView.id: (context) => const InstructorLoginView(),
        InstructorForgetPasswordView.id: (context) =>
            const InstructorForgetPasswordView(),
        InstructorResetPasswordView.id: (context) =>
            const InstructorResetPasswordView(),
        InstructorVerfiyView.id: (context) => const InstructorVerfiyView(),
        InstructorSignupView.id: (context) => const InstructorSignupView(),
        StudentChooseView.id: (context) => const StudentChooseView(),
        StudentLoginView.id: (context) => const StudentLoginView(),
        StudentSignupView.id: (context) => const StudentSignupView(),
        StudentForgetPasswordView.id: (context) =>
            const StudentForgetPasswordView(),
        StudentVerfiyView.id: (context) => const StudentVerfiyView(),
        StudentResetPasswordView.id: (context) =>
            const StudentResetPasswordView(),
        StudentResetPasswordSuccesView.id: (context) =>
            const StudentResetPasswordSuccesView(),
            StudentHomeView.id:(context)=>const StudentHomeView(),
            StudentSearchView.id:(context)=>const StudentSearchView()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins', scaffoldBackgroundColor: kPrimaryColor),
      home: const WelcomeView(),
    );
  }
}
