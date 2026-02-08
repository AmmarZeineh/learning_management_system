import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/cubits/fetch_courses_cubit/fetch_courses_cubit_cubit.dart';
import 'package:coursecraft/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/models/course_model.dart';
import 'package:coursecraft/views/instructor_forget_password_view.dart';
import 'package:coursecraft/views/instructor_home_view.dart';
import 'package:coursecraft/widgets/custom_button.dart';
import 'package:coursecraft/widgets/app_scaffold.dart';
import 'package:coursecraft/widgets/custum_text_field.dart';
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
                fillColor: Colors.white,
                hintText: "email",
                onChanged: (p0) => email = p0,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                fillColor: Colors.white,
                hintText: "Password",
                obs: true,
                onChanged: (p0) => password = p0,
              ),
              const SizedBox(height: 50),
              BlocBuilder<TeacherAuthCubit, TeacherAuthState>(
                builder: (context, state) {
                  return CustomButton(
                    title: state is TeacherLoginLoading
                        ? 'Loading..'
                        : "Sign in",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {});

                        await BlocProvider.of<TeacherAuthCubit>(
                          context,
                        ).teacherLogIn(email: email!, password: password!);
                        if (state is TeacherLoginFailure) {
                          showSnackBar(context, state.errMessage);
                        } else {
                          try {
                            await Navigator.pushNamedAndRemoveUntil(
                              context,
                              InstructorHomeView.id,
                              (Route<dynamic> route) => false,
                              arguments:
                                  await BlocProvider.of<FetchCoursesCubit>(
                                        context,
                                      ).getAllCourses(
                                        id: BlocProvider.of<TeacherAuthCubit>(
                                          context,
                                        ).teacherModel!.teacherId!,
                                      )
                                      as List<CourseModel>,
                            );
                          } on Exception catch (e) {
                            showSnackBar(context, e.toString());
                          }
                        }
                      }
                    },
                    textColor: Colors.white,
                    buttonColor: kPrimaryColor,
                  );
                },
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, InstructorForgetPasswordView.id);
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
    );
  }
}
