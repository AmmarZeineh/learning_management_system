import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/helper/show_snak_bar.dart';
import 'package:learning_management_system/services/signup_service.dart';
import 'package:learning_management_system/views/student_login_view.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/custum_text_field.dart';
import 'package:learning_management_system/widgets/student/custom_container.dart';
import 'package:svg_flutter/svg.dart';

class StudentSignupView extends StatelessWidget {
  StudentSignupView({super.key});
  static String id = "Student Signup";

  GlobalKey<FormState> formkey = GlobalKey();

  late String email, phone, userName, password, role;

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
      body: Form(
        key: formkey,
        child: CustomContainer(
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
                  height: 30,
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
                  hintText: "PhoneNumber",
                  onChanged: (data) {
                    phone = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: "UserName",
                  onChanged: (data) {
                    userName = data;
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
                  height: 10,
                ),
                CustomTextField(
                  hintText: "Role",
                  onChanged: (data) {
                    role = data;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  title: "Sign in",
                  textColor: Colors.white,
                  buttonColor: kPrimaryColor,
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      try {
                        await SignupService().SignUp(
                            email: email,
                            phone: phone,
                            username: userName,
                            password: password,
                            role: role);
                        Navigator.pushReplacementNamed(
                            context, StudentLoginView.id);
                      } on Exception catch (e) {
                        showMessage(context, e.toString());
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
