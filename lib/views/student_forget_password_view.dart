// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/student_verfiy_view.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/student/custom_container.dart';
import 'package:learning_management_system/widgets/student/custum_text_field.dart';
import 'package:svg_flutter/svg.dart';
//var
class StudentForgetPasswordView extends StatelessWidget {
  const StudentForgetPasswordView({super.key});
  static String id = "StudentForgetPassword";

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
            "Forget password",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: CustomContainer(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SvgPicture.asset(
              'assets/images/undraw_forgot_password_re_hxwm.svg',
              height: 250,
            ),
            const SizedBox(
              height: 60,
            ),
            const CustomTextField(hintText: "Phone number"),
            const SizedBox(
              height: 100,
            ),
            CustomButton(
              title: "Submit",
              textColor: Colors.white,
              buttonColor: primaryColor,
              onTap: () {
                Navigator.pushNamed(context, StudentVerfiyView.id);
              },
            ),
          ],
        ),
      )),
    );
  }
}
