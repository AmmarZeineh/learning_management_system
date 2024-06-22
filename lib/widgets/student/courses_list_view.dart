import 'package:flutter/material.dart';

import 'package:learning_management_system/widgets/student/custom_card.dart';

class CoursesListView extends StatelessWidget {
  const CoursesListView({super.key});
  final List<String> courses = const [
    "Course 1",
    "Course 2",
    "Course 3",
    "Course 4"
  ];

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
            child: CustomCard(
              text: courses[index],
            ),
          );
        },
      ),
    );
  }
}
