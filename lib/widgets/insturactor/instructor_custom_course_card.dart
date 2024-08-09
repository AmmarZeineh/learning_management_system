import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management_system/cubits/fetch_comments_cubit/fetch_comments_cubit.dart';
import 'package:learning_management_system/models/course_model.dart';
import 'package:learning_management_system/services/get_coure_earnings.dart';
import 'package:learning_management_system/services/get_course_rating.dart';
import 'package:learning_management_system/views/instructor_course_details_view.dart';
import 'package:svg_flutter/svg.dart';

class InstructorCustomCourseCard extends StatelessWidget {
  const InstructorCustomCourseCard({
    super.key,
    required this.courseModel,
  });
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.pushNamed(context, InstructorCourseDetailsView.id,
            arguments: [
              courseModel,
              await GetCourseRating().getCourseRating(courseModel: courseModel),
              await BlocProvider.of<FetchCommentsCubit>(context)
                  .fetchComments(courseId: courseModel.courseId),
              await GetCoureEarnings()
                  .getCoureEarnings(courseModel: courseModel)
            ]);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/online_learning.svg',
              height: 100,
            ),
            Container(
              height: 50,
              width: 150,
              decoration: const BoxDecoration(
                color: Color(0xff7183BE),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  courseModel.courseName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
