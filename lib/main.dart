import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/cubits/bottom_sheet_cubit/bottom_sheet_cubit.dart';
import 'package:learning_management_system/cubits/bottom_sheet_quiz_cubit/bottom_sheet_quiz_cubit.dart';
import 'package:learning_management_system/cubits/fetch_courses_cubit/fetch_courses_cubit_cubit.dart';
import 'package:learning_management_system/cubits/fetch_quizzes_cubit/fetch_quizzes_cubit.dart';
import 'package:learning_management_system/cubits/upload_files_and_videos_cubit/upload_files_and_videos_cubit.dart';
import 'package:learning_management_system/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:learning_management_system/views/instructor_course_details_view.dart';
import 'package:learning_management_system/views/instructor_files_view.dart';
import 'package:learning_management_system/views/instructor_forget_password_view.dart';
import 'package:learning_management_system/views/instructor_home_view.dart';
import 'package:learning_management_system/views/instructor_home_view_body.dart';
import 'package:learning_management_system/views/instructor_profile_view.dart';
import 'package:learning_management_system/views/instructor_quiz_details_view.dart';
import 'package:learning_management_system/views/instructor_quizezzes_view.dart';
import 'package:learning_management_system/views/instructor_reset_password_success.dart';
import 'package:learning_management_system/views/instructor_reset_password_view.dart';
import 'package:learning_management_system/views/instructor_signup.dart';
import 'package:learning_management_system/views/instructor_verfiy_view.dart';
import 'package:learning_management_system/views/instructor_login_view.dart';
import 'package:learning_management_system/views/instructor_choose_view.dart';
import 'package:learning_management_system/views/welcome_view.dart';

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
        ),
        BlocProvider(
          create: (context) => FetchCoursesCubit(),
        ),
        BlocProvider(
          create: (context) => BottomSheetCubit(),
        ),
        BlocProvider(
          create: (context) => UploadFilesAndVideosCubit(),
        ),
        BlocProvider(
          create: (context) => BottomSheetQuizCubit(),
        ),
        BlocProvider(
          create: (context) => FetchQuizzesCubit(),
        )
      ],
      child: MaterialApp(
        initialRoute: WelcomeView.id,
        routes: {
          InstructorQuizzesView.id: (context) => const InstructorQuizzesView(),
          InstructorFilesView.id: (context) => const InstructorFilesView(),
          WelcomeView.id: (context) => const WelcomeView(),
          InstructorChooseView.id: (context) => const InstructorChooseView(),
          InstructorLoginView.id: (context) => const InstructorLoginView(),
          InstructorHomeView.id: (context) => const InstructorHomeView(),
          InstructorForgetPasswordView.id: (context) =>
              const InstructorForgetPasswordView(),
          InstructorResetPasswordView.id: (context) =>
              const InstructorResetPasswordView(),
          InstructorVerfiyView.id: (context) => const InstructorVerfiyView(),
          InstructorSignupView.id: (context) => const InstructorSignupView(),
          InstructorResetPasswordSuccessView.id: (context) =>
              const InstructorResetPasswordSuccessView(),
          InstructorHomeViewBody.id: (context) =>
              const InstructorHomeViewBody(),
          InstructorProfileView.id: (context) => const InstructorProfileView(),
          InstructorCourseDetailsView.id: (context) =>
              const InstructorCourseDetailsView(),
          InstructorQuizDetailsView.id: (context) =>
              const InstructorQuizDetailsView()
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Poppins', scaffoldBackgroundColor: kPrimaryColor),
        home: const WelcomeView(),
      ),
    );
  }
}
