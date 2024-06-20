import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:learning_management_system/helper/show_snack_bar.dart';
import 'package:learning_management_system/views/instructor_forget_password_view.dart';
import 'package:learning_management_system/views/instructor_home_view.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/app_scaffold.dart';
import 'package:learning_management_system/widgets/custum_text_field.dart';
import 'package:svg_flutter/svg.dart';

class InstructorLoginView extends StatefulWidget {
  const InstructorLoginView({super.key});

  static const id = 'Insturctor Login View';

  @override
  State<InstructorLoginView> createState() => _InstructorLoginViewState();
}

class _InstructorLoginViewState extends State<InstructorLoginView> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  String? phonenumber;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Welcome Back',
      containerChild: Form(
        key: formKey,
        child: BlocBuilder<TeacherAuthCubit, TeacherAuthState>(
          builder: (context, state) {
            if (state is TeacherAuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
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
                    hintText: "email",
                    onChanged: (p0) => email = p0,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: "Password",
                    obs: true,
                    onChanged: (p0) => password = p0,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                      title: "Sign in",
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {});

                          BlocProvider.of<TeacherAuthCubit>(context)
                              .teacherLogIn(
                            email: email!,
                            password: password!,
                          );

                          if (state is TeacherAuthFailure) {
                            showSnackBar(context, state.errMessage);
                          } else if (state is TeacherAuthSuccess) {
                            Navigator.pushNamed(context, InstructorHomeView.id);
                          }
                        }
                      },
                      textColor: Colors.white,
                      buttonColor: primaryColor),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, InstructorForgetPasswordView.id);
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
            );
          },
        ),
      ),
    );
  }
}
