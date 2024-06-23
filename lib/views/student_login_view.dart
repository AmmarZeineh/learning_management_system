import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/helper/show_snak_bar.dart';
import 'package:learning_management_system/services/login_service.dart';
import 'package:learning_management_system/views/Student_home_view.dart';
import 'package:learning_management_system/views/student_forget_password_view.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/custum_text_field.dart';
import 'package:learning_management_system/widgets/student/custom_container.dart';
import 'package:svg_flutter/svg.dart';

class StudentLoginView extends StatelessWidget {
  StudentLoginView({super.key});
  static String id = "Student login";

  GlobalKey<FormState> formkey = GlobalKey();

  late String email;

  late String password;

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
            "Welcome back",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      // ignore: prefer_const_constructors
      body: Form(
        key: formkey,
        child: CustomContainer(
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
                CustomTextField(
                  hintText: "Email",
                  onChanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: "Password",
                  obs: true,
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  title: "Sign in",
                  textColor: Colors.white,
                  buttonColor: kPrimaryColor,
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      try {
                        await LoginService()
                            .login(email: email, password: password);
                        Navigator.pushReplacementNamed(
                            context, StudentHomeView.id);
                      } on Exception catch (e) {
                        showMessage(context, e.toString());
                      }
                    }
                  },
                ),
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
      ),
    );
  }
}
