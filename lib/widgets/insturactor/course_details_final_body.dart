import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/metods.dart';
import 'package:learning_management_system/models/course_model.dart';
import 'package:learning_management_system/views/instructor_files_view.dart';
import 'package:learning_management_system/widgets/insturactor/course_details.dart';
import 'package:learning_management_system/widgets/insturactor/custom_elevated_button.dart';
import 'package:svg_flutter/svg.dart';

class CourseDetailsFinalBody extends StatelessWidget {
  const CourseDetailsFinalBody({super.key, required this.courseModel});
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
          width: double.infinity,
        ),
        SvgPicture.asset(
          'assets/images/online_learning.svg',
          height: 230,
        ),
        const SizedBox(
          height: 30,
        ),
        CourseDetails(
          title: 'Course Name',
          subTitle: courseModel.courseName,
          onPressed: () async {
            showEditDialog(context,
                courseModel: courseModel,
                hintText: 'Course Name',
                changingValue: 'course_name');
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CourseDetails(
          title: 'Course Type',
          subTitle: courseModel.courseType,
          onPressed: () async {
            showEditDialog(context,
                courseModel: courseModel,
                hintText: 'Course Type',
                changingValue: 'course_type');
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CourseDetails(
          title: 'Course Description',
          subTitle: courseModel.courseDes,
          onPressed: () async {
            showEditDialog(context,
                courseModel: courseModel,
                hintText: 'Course Description',
                changingValue: 'course_description');
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CourseDetails(
          title: 'Course Price',
          subTitle: courseModel.coursePrice.toString(),
          onPressed: () async {
            showEditDialog(context,
                courseModel: courseModel,
                hintText: 'Course Price',
                changingValue: 'course_price');
          },
        ),
        const SizedBox(
          height: 60,
        ),
        Row(
          children: [
            CustomElevatedButton(
              textColor: Colors.white,
              courseModel: courseModel,
              onPressed: () {
                showDeleteCourseDialog(context, courseModel);
              },
              text: 'Delete Your Course',
              color: Colors.red,
            ),
            const Spacer(),
            CustomElevatedButton(
              textColor: Colors.white,
              courseModel: courseModel,
              onPressed: () {
                Navigator.pushNamed(context, InstructorFilesView.id);
              },
              text: 'View Course Files',
              color: kPrimaryColor,
            )
          ],
        ),
      ],
    );
  }
}
