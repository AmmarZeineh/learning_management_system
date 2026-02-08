import 'package:coursecraft/constants.dart';
import 'package:coursecraft/cubits/bottom_sheet_cubit/bottom_sheet_cubit.dart';
import 'package:coursecraft/cubits/bottom_sheet_quiz_cubit/bottom_sheet_quiz_cubit.dart';
import 'package:coursecraft/cubits/chat_cubit/chat_cubit.dart';
import 'package:coursecraft/cubits/cubit/fetcht_teacher_videos_cubit.dart';
import 'package:coursecraft/cubits/fetch_comments_cubit/fetch_comments_cubit.dart';
import 'package:coursecraft/cubits/fetch_courses_cubit/fetch_courses_cubit_cubit.dart';
import 'package:coursecraft/cubits/fetch_quizzes_cubit/fetch_quizzes_cubit.dart';
import 'package:coursecraft/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:coursecraft/cubits/upload_files_and_videos_cubit/upload_files_and_videos_cubit.dart';
import 'package:coursecraft/firebase_options.dart';
import 'package:coursecraft/scubits/chat_cubit/schat_cubit.dart';
import 'package:coursecraft/scubits/comment_cubit/fetch_comment_cubit.dart';
import 'package:coursecraft/scubits/fetch_course_cubit/fetch_course_cubit_cubit.dart';
import 'package:coursecraft/scubits/fetch_my_courses_cubit/fetch_my_courses_cubit.dart';
import 'package:coursecraft/scubits/fetch_quizes_cubit/fetch_my_quizes_cubit.dart';
import 'package:coursecraft/scubits/fetch_videos/fetch_videos_cubit.dart';
import 'package:coursecraft/scubits/student_auth_cubit/student_auth_cubit.dart';
import 'package:coursecraft/views/chat_view.dart';
import 'package:coursecraft/views/instructor_chat_view.dart';
import 'package:coursecraft/views/instructor_choose_view.dart';
import 'package:coursecraft/views/instructor_course_details_view.dart';
import 'package:coursecraft/views/instructor_files_view.dart';
import 'package:coursecraft/views/instructor_forget_password_view.dart';
import 'package:coursecraft/views/instructor_home_view.dart';
import 'package:coursecraft/views/instructor_home_view_body.dart';
import 'package:coursecraft/views/instructor_login_view.dart';
import 'package:coursecraft/views/instructor_profile_view.dart';
import 'package:coursecraft/views/instructor_quiz_details_view.dart';
import 'package:coursecraft/views/instructor_quizezzes_view.dart';
import 'package:coursecraft/views/instructor_signup.dart';
import 'package:coursecraft/views/instructor_view_files_view.dart';
import 'package:coursecraft/views/student_all_courses_view.dart';
import 'package:coursecraft/views/student_card_view.dart';
import 'package:coursecraft/views/student_choose_view.dart';
import 'package:coursecraft/views/student_course_content.dart';
import 'package:coursecraft/views/student_course_info_view.dart';
import 'package:coursecraft/views/student_cousre_register_info_view.dart';
import 'package:coursecraft/views/student_home_view.dart';
import 'package:coursecraft/views/student_login_view.dart';
import 'package:coursecraft/views/student_mycorses_view.dart';
import 'package:coursecraft/views/student_play_video_view.dart';
import 'package:coursecraft/views/student_profile_view.dart';
import 'package:coursecraft/views/student_quiz_view.dart';
import 'package:coursecraft/views/student_signup.dart';
import 'package:coursecraft/views/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const LearningManagementSystem());
}

class LearningManagementSystem extends StatelessWidget {
  const LearningManagementSystem({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TeacherAuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => FetchtTeacherVideosCubit()),
        BlocProvider(create: (context) => FetchCoursesCubit()),
        BlocProvider(create: (context) => BottomSheetCubit()),
        BlocProvider(create: (context) => UploadFilesAndVideosCubit()),
        BlocProvider(create: (context) => BottomSheetQuizCubit()),
        BlocProvider(create: (context) => FetchQuizzesCubit()),
        BlocProvider(create: (context) => FetchCommentsCubit()),
        BlocProvider(create: (context) => StudentAuthCubit()),
        BlocProvider(create: (context) => FetchCourseCubitCubit()),
        BlocProvider(create: (context) => FetchMyCoursesCubit()),
        BlocProvider(create: (context) => FetchVideosCubit()),
        BlocProvider(create: (context) => FetchCommentCubit()),
        BlocProvider(create: (context) => FetchMyQuizesCubit()),
        BlocProvider(create: (context) => StudentAuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => FetchCourseCubitCubit()),
        BlocProvider(create: (context) => FetchMyCoursesCubit()),
        BlocProvider(create: (context) => FetchVideosCubit()),
        BlocProvider(create: (context) => FetchCommentCubit()),
        BlocProvider(create: (context) => FetchMyQuizesCubit()),
        BlocProvider(create: (context) => SChatCubit()),
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
          InstructorSignupView.id: (context) => const InstructorSignupView(),
          InstructorHomeViewBody.id: (context) =>
              const InstructorHomeViewBody(),
          InstructorProfileView.id: (context) => const InstructorProfileView(),
          InstructorCourseDetailsView.id: (context) =>
              const InstructorCourseDetailsView(),
          InstructorViewFilesView.id: (context) =>
              const InstructorViewFilesView(),
          InstructorQuizDetailsView.id: (context) =>
              const InstructorQuizDetailsView(),
          InstructorGroupView.id: (context) => const InstructorGroupView(),
          StudentChooseView.id: (context) => const StudentChooseView(),
          StudentLoginView.id: (context) => StudentLoginView(),
          StudentSignupView.id: (context) => StudentSignupView(),
          StudentHomeView.id: (context) => const StudentHomeView(),
          StudentProfileView.id: (context) => const StudentProfileView(),
          StudentMycorsesView.id: (context) => const StudentMycorsesView(),
          StudentCourseInfoView.id: (context) => const StudentCourseInfoView(),
          StudentAllCoursesView.id: (context) => const StudentAllCoursesView(),
          StudentCardView.id: (context) => const StudentCardView(),
          StudentCourseContent.id: (context) => const StudentCourseContent(),
          StudentPlayVideoView.id: (context) => const StudentPlayVideoView(),
          StudentCousreRegisterInfoView.id: (context) =>
              const StudentCousreRegisterInfoView(),
          StudentQuizView.id: (context) => const StudentQuizView(),
          StudentGroupView.id: (context) => const StudentGroupView(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        home: const WelcomeView(),
      ),
    );
  }
}
