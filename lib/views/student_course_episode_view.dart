import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/login_signup_scaffold.dart';

class StudentCourseInfoView extends StatelessWidget {
  const StudentCourseInfoView({super.key});
  static String id = "StudentCourseInfo";

  @override
  Widget build(BuildContext context) {
    return const LoginSignUpScaffold(
      title: 'flutter master',
      containerChild: Column(),
    );
  }
}
