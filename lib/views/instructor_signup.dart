import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:learning_management_system/helper/show_snack_bar.dart';
import 'package:learning_management_system/views/instructor_login_view.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/insturactor/upload_image_and_file_chosen_container.dart';
import 'package:learning_management_system/widgets/app_scaffold.dart';
import 'package:learning_management_system/widgets/custum_text_field.dart';
import 'package:svg_flutter/svg.dart';

class InstructorSignupView extends StatefulWidget {
  const InstructorSignupView({super.key});

  static String id = 'InsturactorSignup';

  @override
  State<InstructorSignupView> createState() => _InstructorSignupViewState();
}

class _InstructorSignupViewState extends State<InstructorSignupView> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  String? username;
  String? phonenumber;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Create New Account',
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
                    'assets/images/undraw_sign_up_n6im.svg',
                    height: 250,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    hintText: "Email",
                    onChanged: (value) => email = value,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: "Phone Number",
                    textInputType: TextInputType.number,
                    onChanged: (value) => phonenumber = value,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: "Username",
                    onChanged: (value) => username = value,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: "Password",
                    obs: true,
                    onChanged: (value) => password = value,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const UploadImageAndChosenFileContainer(),
                  const SizedBox(height: 30),
                  CustomButton(
                    title: "Sign up",
                    textColor: Colors.white,
                    buttonColor: kPrimaryColor,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {});

                        BlocProvider.of<TeacherAuthCubit>(context)
                            .teacherSignUp(
                                username: username!,
                                password: password!,
                                phonenumber: phonenumber!,
                                email: email!);
                        if (state is TeacherAuthFailure) {
                          showSnackBar(context, state.errMessage);
                        } else if (state is TeacherAuthSuccess) {
                          Navigator.pushReplacementNamed(
                              context, InstructorLoginView.id);
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
//