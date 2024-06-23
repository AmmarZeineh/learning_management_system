import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/login_signup_scaffold.dart';
import 'package:learning_management_system/widgets/student/quize_card_listview.dart';

class StudentMyQuizesView extends StatelessWidget {
  const StudentMyQuizesView({super.key});
  static String id = "Student My Quizesw";

  @override
  Widget build(BuildContext context) {
    return const LoginSignUpScaffold(
        title: "My Quizes",
        containerChild:
            SizedBox(height: 700, child: CustomQuizeCardListView()));
  }
}
