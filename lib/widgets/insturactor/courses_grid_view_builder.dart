import 'package:flutter/material.dart';
import 'package:coursecraft/models/course_model.dart';
import 'package:coursecraft/widgets/insturactor/instructor_custom_course_card.dart';

class CoursesGridViewBuilder extends StatelessWidget {
  const CoursesGridViewBuilder({super.key, required this.coursesList});
  final List<CourseModel> coursesList;

  @override
  Widget build(BuildContext context) {
    if (coursesList.isNotEmpty) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: GridView.builder(
            itemCount: coursesList.length,
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 4 / 3.5,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InstructorCustomCourseCard(
                  courseModel: coursesList[index],
                ),
              );
            },
          ),
        ),
      );
    } else {
      return const Center(
        child: Text(
          'You Haven\'t created Any Course Yet',
          style: TextStyle(fontSize: 18),
        ),
      );
    }
  }
}
