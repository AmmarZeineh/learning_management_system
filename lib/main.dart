import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:learning_management_system/views/instructor_forget_password_view.dart';
import 'package:learning_management_system/views/instructor_home_view.dart';
import 'package:learning_management_system/views/instructor_reset_password_success.dart';
import 'package:learning_management_system/views/instructor_reset_password_view.dart';
import 'package:learning_management_system/views/instructor_signup.dart';
import 'package:learning_management_system/views/instructor_verfiy_view.dart';
import 'package:learning_management_system/views/instructor_login_view.dart';
import 'package:learning_management_system/views/instructor_choose_view.dart';

import 'package:learning_management_system/views/welcome_view.dart';
//

void main() {
  runApp(const LearningManagementSystem());
}

class LearningManagementSystem extends StatelessWidget {
  const LearningManagementSystem({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TeacherAuthCubit(),
        )
      ],
      child: MaterialApp(
        initialRoute: WelcomeView.id,
        routes: {
          WelcomeView.id: (context) => const WelcomeView(),
          InstructorChooseView.id: (context) => const InstructorChooseView(),
          InstructorLoginView.id: (context) => const InstructorLoginView(),
          InstructorForgetPasswordView.id: (context) =>
              const InstructorForgetPasswordView(),
          InstructorResetPasswordView.id: (context) =>
              const InstructorResetPasswordView(),
          InstructorVerfiyView.id: (context) => const InstructorVerfiyView(),
          InstructorSignupView.id: (context) => const InstructorSignupView(),
          InstructorResetPasswordSuccessView.id: (context) =>
              const InstructorResetPasswordSuccessView(),
          InstructorHomeView.id: (context) => const InstructorHomeView()
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Poppins', scaffoldBackgroundColor: primaryColor),
        home: const WelcomeView(),
      ),
    );
  }
}
