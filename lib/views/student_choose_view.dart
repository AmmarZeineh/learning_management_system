import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/student_login_view.dart';
import 'package:learning_management_system/views/student_signup.dart';
import 'package:learning_management_system/widgets/custom_button.dart';

import 'package:svg_flutter/svg.dart';

class StudentChooseView extends StatelessWidget {
  const StudentChooseView({super.key});
  static String id = "Student choosing";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/undraw_road_sign_re_3kc3.svg',
              height: 300,
            ),
            const SizedBox(
              height: 250,
            ),
            CustomButton(
              title: 'Sign in',
              textColor: Colors.white,
              buttonColor: primaryColor,
              onTap: () {
                Navigator.pushNamed(context, StudentLoginView.id);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              title: 'Sign up',
              textColor: Colors.white,
              buttonColor: primaryColor,
              onTap: () {
                Navigator.pushNamed(context, StudentSignupView.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
