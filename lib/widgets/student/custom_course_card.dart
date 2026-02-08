import 'package:flutter/material.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/views/student_course_content.dart';
import 'package:svg_flutter/svg.dart';

class CustomCourseCard extends StatelessWidget {
  const CustomCourseCard({super.key, required this.courseModel});
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        StudentCourseContent.id,
        arguments: courseModel,
      ),
      child: SizedBox(
        height: 140,
        child: Card(
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    "assets/images/undraw_business_chat_re_gg4h.svg",
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        courseModel.courseName,
                        style: const TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
