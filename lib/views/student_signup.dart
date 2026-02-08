import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/scubits/student_auth_cubit/student_auth_cubit.dart';
import 'package:coursecraft/views/student_login_view.dart';
import 'package:coursecraft/widgets/custom_button.dart';
import 'package:coursecraft/widgets/custum_text_field.dart';
import 'package:coursecraft/widgets/student/custom_container.dart';
import 'package:svg_flutter/svg.dart';

//
// ignore: must_be_immutable
class StudentSignupView extends StatelessWidget {
  StudentSignupView({super.key});
  static String id = "Student Signup";

  GlobalKey<FormState> formkey = GlobalKey();

  late String email, phone, userName, password;
  String role = "student";

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
                const SizedBox(height: 30),
                CustomTextField(
                  fillColor: Colors.white,
                  hintText: "Email",
                  onChanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  fillColor: Colors.white,
                  hintText: "PhoneNumber",
                  onChanged: (data) {
                    phone = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  fillColor: Colors.white,
                  hintText: "UserName",
                  onChanged: (data) {
                    userName = data;
                  },
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
                const SizedBox(height: 30),
                CustomButton(
                  title: "Sign up",
                  textColor: Colors.white,
                  buttonColor: kPrimaryColor,
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      try {
                        await BlocProvider.of<StudentAuthCubit>(context).signUp(
                          email: email,
                          phone: phone,
                          username: userName,
                          password: password,
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          StudentLoginView.id,
                        );
                      } on Exception catch (e) {
                        showSnackBar(context, e.toString());
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
