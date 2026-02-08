import 'package:flutter/material.dart';
import 'package:coursecraft/smodels/course_modal.dart';

import 'package:coursecraft/widgets/student/custom_card.dart';

class QuizesListView extends StatelessWidget {
  QuizesListView({super.key});
  final List<CourseModel> courses = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: courses.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomCard(courseModel: courses[index]),
          );
        },
      ),
    );
  }
}
