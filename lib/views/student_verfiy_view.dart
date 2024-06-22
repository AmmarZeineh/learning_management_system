import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/student_reset_password_view.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/student/custom_container.dart';
import 'package:flutter_verification_code_field/flutter_verification_code_field.dart';
import 'package:svg_flutter/svg.dart';

class StudentVerfiyView extends StatelessWidget {
  const StudentVerfiyView({super.key});
  static String id = "StudentVerfiy";

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
            "Verification",
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
              'assets/images/undraw_secure_login_pdn4.svg',
              height: 250,
            ),
            const SizedBox(
              height: 50,
            ),
            VerificationCodeField(
              length: 5,
              onFilled: (value) => log(value),
              size: const Size(30, 60),
              spaceBetween: 16,
              matchingPattern: RegExp(r'^\d+$'),
            ),
            const SizedBox(
              height: 100,
            ),
            CustomButton(
              title: "Verifiy",
              textColor: Colors.white,
              buttonColor: kPrimaryColor,
              onTap: () {
                Navigator.pushNamed(context, StudentResetPasswordView.id);
              },
            ),
          ],
        ),
      )),
    );
  }
}
