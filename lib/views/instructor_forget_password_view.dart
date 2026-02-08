import 'package:flutter/material.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/widgets/custom_button.dart';
import 'package:coursecraft/widgets/app_scaffold.dart';
import 'package:coursecraft/widgets/custum_text_field.dart';
import 'package:svg_flutter/svg.dart';

class InstructorForgetPasswordView extends StatelessWidget {
  const InstructorForgetPasswordView({super.key});

  static String id = 'InsturactorForgetPasswordView';

  @override
  Widget build(BuildContext context) {
    String? email;
    return AppScaffold(
      title: 'Forgot Your Password',
      containerChild: Column(
        children: [
          const SizedBox(height: 40),
          SvgPicture.asset(
            'assets/images/undraw_forgot_password_re_hxwm.svg',
            height: 250,
          ),
          const SizedBox(height: 60),
          CustomTextField(
            fillColor: Colors.white,
            hintText: "Email",
            onChanged: (p0) {
              email = p0;
            },
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 100),
          CustomButton(
            title: "Submit",
            textColor: Colors.white,
            buttonColor: kPrimaryColor,
            onTap: () async {
              try {
                dynamic data = await Api().post(
                  url: '${baseUrl}user/sendResetLinkEmail',
                  body: {'email': email},
                  token: null,
                );
                showSnackBar(context, data['message']);
              } on Exception catch (e) {
                showSnackBar(context, e.toString());
              }
            },
          ),
        ],
      ),
    );
  }
}
//