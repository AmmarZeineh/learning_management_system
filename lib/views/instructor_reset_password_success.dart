import 'package:flutter/material.dart';
import 'package:learning_management_system/views/instructor_home_view.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:svg_flutter/svg.dart';

class InstructorResetPasswordSuccessView extends StatelessWidget {
  const InstructorResetPasswordSuccessView({super.key});

  static String id = 'InstructorResetPasswordSuccessView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 120,
            width: MediaQuery.of(context).size.width,
          ),
          SvgPicture.asset(
            'assets/images/undraw_authentication_re_svpt.svg',
            height: 300,
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Reset Password Success',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Congratulations, your password has been reset successfully. You can Sign in again',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: CustomButton(
              title: 'Back To Sign In',
              textColor: Colors.white,
              buttonColor: const Color(0xff6f7ec3),
              onTap: () {
                Navigator.pushNamed(context, InstructorHomeView.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
//