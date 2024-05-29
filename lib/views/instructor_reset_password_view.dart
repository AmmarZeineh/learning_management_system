import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/instructor_reset_password_success.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/login_signup_scaffold.dart';
import 'package:learning_management_system/widgets/custum_text_field.dart';
import 'package:svg_flutter/svg.dart';

class InstructorResetPasswordView extends StatelessWidget {
  const InstructorResetPasswordView({super.key});

  static String id = 'InsturactorResetPasswordView';

  @override
  Widget build(BuildContext context) {
    return LoginSignUpScaffold(
      title: 'Reset Your Password',
      containerChild: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SvgPicture.asset(
            'assets/images/undraw_my_password_re_ydq7.svg',
            height: 250,
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomTextField(
            hintText: "New password",
            obs: true,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(
            hintText: "Confirm password",
            obs: true,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
              title: "Confirm",
              textColor: Colors.white,
              buttonColor: primaryColor,
              onTap: () => Navigator.pushNamed(
                  context, InstructorResetPasswordSuccessView.id)),
        ],
      ),
    );
  }
}
