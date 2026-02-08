import 'package:flutter/material.dart';
import 'package:coursecraft/smodels/course_modal.dart';

import 'package:coursecraft/views/student_course_info_view.dart';
import 'package:svg_flutter/svg.dart';

class CustomSearchCard extends StatelessWidget {
  const CustomSearchCard({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/images/online_learning.svg",
              width: 80,
              height: 80,
            ),
            const SizedBox(width: 50),
            Expanded(
              child: Text(
                courseModel.courseName,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_circle_right),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  StudentCourseInfoView.id,
                  arguments: courseModel,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
