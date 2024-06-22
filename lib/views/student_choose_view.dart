import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/student_login_view.dart';
import 'package:learning_management_system/views/student_signup.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:svg_flutter/svg.dart';

class StudentChooseView extends StatelessWidget {
  const StudentChooseView({super.key});
  static String id = "StudentChoose";

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
              height: 50,
            ),
            const Text(
              'SignUp Or Already has an account?',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 150,
            ),
            CustomButton(
              title: 'Login',
              textColor: Colors.white,
              buttonColor: kPrimaryColor,
              onTap: () => Navigator.pushNamed(context, StudentLoginView.id),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              title: 'SignUp',
              textColor: Colors.white,
              buttonColor: kPrimaryColor,
              onTap: () {
                Navigator.pushNamed(context, StudentSignupView.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
