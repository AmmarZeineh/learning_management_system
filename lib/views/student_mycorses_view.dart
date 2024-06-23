import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/login_signup_scaffold.dart';
import 'package:learning_management_system/widgets/student/custom_course_card_listview.dart';

class StudentMycorsesView extends StatelessWidget {
  const StudentMycorsesView({super.key});
  static String id = "StudentMycorses";

  @override
  Widget build(BuildContext context) {
    return const LoginSignUpScaffold(
      title: "My Courses",
      containerChild: SizedBox(height: 700, child: CustomCoursCardListView()),
    );
  }
}
