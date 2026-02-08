import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/scubits/fetch_quizes_cubit/fetch_my_quizes_cubit.dart';
import 'package:coursecraft/scubits/fetch_videos/fetch_videos_cubit.dart';
import 'package:coursecraft/scubits/student_auth_cubit/student_auth_cubit.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/smodels/question_model/question_model.dart';
import 'package:coursecraft/smodels/video_model.dart';
import 'package:coursecraft/views/student_cousre_register_info_view.dart';
import 'package:coursecraft/widgets/app_scaffold.dart';
import 'package:coursecraft/widgets/student/content_listview.dart';
import 'package:coursecraft/widgets/student/quize_card_listview.dart';

//
class StudentCourseContent extends StatelessWidget {
  const StudentCourseContent({super.key});
  static String id = "course content";

  @override
  Widget build(BuildContext context) {
    CourseModel courseModel =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    return AppScaffold(
      title: courseModel.courseName,
      containerChild: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Course content :",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    StudentCousreRegisterInfoView.id,
                    arguments: courseModel,
                  );
                },
                icon: const Icon(Icons.info),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FutureBuilder(
            future: BlocProvider.of<FetchVideosCubit>(
              context,
            ).getVideos(id: courseModel.courseId.toString()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<VideoModel> videos = snapshot.data!;

                return SizedBox(
                  height: 300,
                  child: ContentCardListView(videos: videos),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Text(
                "Course quizes :",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FutureBuilder(
            future: BlocProvider.of<FetchMyQuizesCubit>(context)
                .getAvailableQuestion(
                  userid: BlocProvider.of<StudentAuthCubit>(
                    context,
                  ).userModel.studentId.toString(),
                  courseId: courseModel.courseId.toString(),
                ),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<QuizModel> questions = snapshot.data!;

                return SizedBox(
                  height: 300,
                  child: CustomQuizeCardListView(quizzes: questions),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text(
                    'There is no quiz',
                    style: TextStyle(fontSize: 20, color: kPrimaryColor),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
