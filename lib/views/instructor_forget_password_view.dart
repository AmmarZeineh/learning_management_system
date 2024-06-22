import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/instructor_verfiy_view.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/app_scaffold.dart';
import 'package:learning_management_system/widgets/custum_text_field.dart';
import 'package:svg_flutter/svg.dart';

class InstructorForgetPasswordView extends StatelessWidget {
  const InstructorForgetPasswordView({super.key});

  static String id = 'InsturactorForgetPasswordView';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Forgot Your Password',
      containerChild: Column(
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
          const CustomTextField(
            hintText: "Phone number",
            textInputType: TextInputType.number,
          ),
          const SizedBox(
            height: 100,
          ),
          CustomButton(
            title: "Submit",
            textColor: Colors.white,
            buttonColor: kPrimaryColor,
            onTap: () {
              Navigator.pushNamed(context, InstructorVerfiyView.id);
            },
          ),
        ],
      ),
    );
  }
}
//