import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/custum_text_field.dart';
import 'package:learning_management_system/widgets/student/custom_container.dart';
import 'package:svg_flutter/svg.dart';

class StudentSignupView extends StatelessWidget {
  const StudentSignupView({super.key});
  static String id = "Student Signup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          title: const Text(
            "Create new account",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      // ignore: prefer_const_constructors
      body: CustomContainer(
        // ignore: prefer_const_constructors
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/undraw_sign_up_n6im.svg',
                height: 250,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(hintText: "Email"),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(hintText: "Phone"),
              const SizedBox(
                height: 10,
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
                  buttonColor: kPrimaryColor),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
