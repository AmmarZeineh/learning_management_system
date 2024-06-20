import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/instructor_forget_password_view.dart';
import 'package:learning_management_system/views/instructor_home_view.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/app_scaffold.dart';
import 'package:learning_management_system/widgets/custum_text_field.dart';
import 'package:svg_flutter/svg.dart';

class InstructorLoginView extends StatelessWidget {
  const InstructorLoginView({super.key});

  static const id = 'Insturctor Login View';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Welcome Back',
      containerChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/undraw_login_re_4vu2.svg',
            height: 250,
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomTextField(hintText: "Username"),
          const SizedBox(
            height: 10,
          ),
          const CustomTextField(
            hintText: "Password",
            obs: true,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
              title: "Sign in",
              onTap: () {
                Navigator.pushNamed(context, InstructorHomeView.id);
              },
              textColor: Colors.white,
              buttonColor: primaryColor),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, InstructorForgetPasswordView.id);
            },
            child: const Text(
              'forget password?',
              style: TextStyle(
                color: Color(0xFF616161),
              ),
            ),
          )
        ],
      ),
    );
  }
}
