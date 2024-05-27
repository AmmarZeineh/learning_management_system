import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/insturactor/upload_image_and_file_chosen_container.dart';
import 'package:learning_management_system/widgets/login_signup_scaffold.dart';
import 'package:learning_management_system/widgets/custum_text_field.dart';
import 'package:svg_flutter/svg.dart';

class InstructorSignupView extends StatelessWidget {
  const InstructorSignupView({super.key});

  static String id = 'InsturactorSignup';

  @override
  Widget build(BuildContext context) {
    return LoginSignUpScaffold(
      title: 'Create New Account',
      containerChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/undraw_sign_up_n6im.svg',
            height: 250,
          ),
          const SizedBox(
            height: 40,
          ),
          const CustomTextField(hintText: "Email"),
          const SizedBox(
            height: 10,
          ),
          const CustomTextField(
            hintText: "Phone",
            textInputType: TextInputType.number,
          ),
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
            height: 25,
          ),
          const UploadImageAndChosenFileContainer(),
          const SizedBox(height: 30),
          const CustomButton(
              title: "Sign up",
              textColor: Colors.white,
              buttonColor: primaryColor),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
