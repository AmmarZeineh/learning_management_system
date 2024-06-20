import 'package:flutter/material.dart';
import 'package:flutter_verification_code_field/flutter_verification_code_field.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/instructor_reset_password_view.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/app_scaffold.dart';
import 'package:svg_flutter/svg.dart';

class InstructorVerfiyView extends StatelessWidget {
  const InstructorVerfiyView({super.key});

  static String id = 'InsturactorVerfiyView';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Verfiy Code',
      containerChild: Column(
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
            onFilled: (value) => print(value),
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
            buttonColor: primaryColor,
            onTap: () {
              Navigator.pushNamed(context, InstructorResetPasswordView.id);
            },
          ),
        ],
      ),
    );
  }
}
