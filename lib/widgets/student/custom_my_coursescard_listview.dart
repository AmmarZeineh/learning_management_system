import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/scubits/fetch_my_courses_cubit/fetch_my_courses_cubit.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/widgets/student/custom_course_card.dart';

class CustomMyCoursCardListView extends StatelessWidget {
  const CustomMyCoursCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CourseModel> courses = BlocProvider.of<FetchMyCoursesCubit>(
      context,
    ).myCourses;

    return ListView.builder(
      itemCount: courses.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CustomCourseCard(courseModel: courses[index]);
      },
    );
  }
}
