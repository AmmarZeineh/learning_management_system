import 'package:flutter/material.dart';

import 'package:learning_management_system/views/student_login_view.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:svg_flutter/svg.dart';

class StudentResetPasswordSuccesView extends StatelessWidget {
  const StudentResetPasswordSuccesView({super.key});
  static String id = "StudentResetPasswordSucces";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/undraw_authentication_re_svpt.svg',
              height: 250,
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Reset password success",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 120,
            ),
            CustomButton(
              title: "Back to Sign in",
              textColor: Colors.white,
              buttonColor: const Color(0xff7183BE),
              onTap: () {
                Navigator.pushReplacementNamed(context, StudentLoginView.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
