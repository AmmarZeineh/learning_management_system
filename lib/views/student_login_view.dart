import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/scubits/student_auth_cubit/student_auth_cubit.dart';

import 'package:coursecraft/views/Student_home_view.dart';
import 'package:coursecraft/views/instructor_forget_password_view.dart';
import 'package:coursecraft/widgets/custom_button.dart';
import 'package:coursecraft/widgets/custum_text_field.dart';
import 'package:coursecraft/widgets/student/custom_container.dart';
import 'package:svg_flutter/svg.dart';

//
// ignore: must_be_immutable
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
                const SizedBox(height: 50),
                CustomTextField(
                  hintText: "Email",
                  onChanged: (data) {
                    email = data;
                  },
                  fillColor: Colors.white,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Password",
                  obs: true,
                  onChanged: (data) {
                    password = data;
                  },
                  fillColor: Colors.white,
                ),
                const SizedBox(height: 50),
                CustomButton(
                  title: "Sign in",
                  textColor: Colors.white,
                  buttonColor: kPrimaryColor,
                  onTap: () async {
                    try {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<StudentAuthCubit>(
                          context,
                        ).userModel = await BlocProvider.of<StudentAuthCubit>(
                          context,
                        ).login(email: email, password: password);

                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          StudentHomeView.id,
                          (Route<dynamic> route) => false,
                        );
                      }
                    } on Exception catch (e) {
                      showSnackBar(context, e.toString());
                    }
                  },
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      InstructorForgetPasswordView.id,
                    );
                  },
                  child: const Text(
                    'forget password?',
                    style: TextStyle(color: Color(0xFF616161)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
