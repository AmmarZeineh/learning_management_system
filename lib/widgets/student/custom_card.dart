import 'package:flutter/material.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/views/student_course_content.dart';
import 'package:svg_flutter/svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        StudentCourseContent.id,
        arguments: courseModel,
      ),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            SvgPicture.asset('assets/images/online_learning.svg', height: 100),
            Container(
              height: 50,
              width: 150,
              decoration: const BoxDecoration(
                color: Color(0xff7183BE),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  courseModel.courseName,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
