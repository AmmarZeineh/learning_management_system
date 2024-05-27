import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/student_forget_password_view.dart';

import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/student/custom_container.dart';
import 'package:learning_management_system/widgets/student/custum_text_field.dart';
import 'package:svg_flutter/svg.dart';

class StudentLoginView extends StatelessWidget {
  const StudentLoginView({super.key});
  static String id = "Student login";
//var
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: primaryColor,
          title: const Text(
            "Welcome back",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      // ignore: prefer_const_constructors
      body: CustomContainer(
        child: SingleChildScrollView(
          child: Column(
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
              const CustomButton(
                  title: "Sign in",
                  textColor: Colors.white,
                  buttonColor: primaryColor),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, StudentForgetPasswordView.id);
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
        ),
      ),
    );
  }
}
