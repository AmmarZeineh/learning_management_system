import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/student/custom_container.dart';
import 'package:learning_management_system/widgets/student/custum_text_field.dart';
import 'package:svg_flutter/svg.dart';

class StudentResetPasswordView extends StatelessWidget {
  const StudentResetPasswordView({super.key});
  static String id = "StudentResetPassword";

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
            "Reset password",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: CustomContainer(
        child: SingleChildScrollView(
          child: Column(
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
              const CustomButton(
                  title: "Confirm",
                  textColor: Colors.white,
                  buttonColor: primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
