import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/student/custom_course_card.dart';

class CustomCoursCardListView extends StatelessWidget {
  const CustomCoursCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const CustomCourseCard();
      },
    );
  }
}
