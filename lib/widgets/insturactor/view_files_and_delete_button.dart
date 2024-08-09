import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/metods.dart';
import 'package:learning_management_system/views/instructor_files_view.dart';
import 'package:learning_management_system/widgets/insturactor/course_details_view_body.dart';
import 'package:learning_management_system/widgets/insturactor/custom_elevated_button.dart';

class ViewFilesAndDeleteCourseButtons extends StatelessWidget {
  const ViewFilesAndDeleteCourseButtons({
    super.key,
    required this.widget,
  });

  final CourseDetailsViewBody widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomElevatedButton(
          textColor: Colors.white,
          courseModel: widget.courseModel,
          onPressed: () {
            Navigator.pushNamed(context, InstructorFilesView.id);
          },
          text: 'View Course Files',
          color: kPrimaryColor,
        ),
        const Spacer(),
        CustomElevatedButton(
          textColor: Colors.white,
          courseModel: widget.courseModel,
          onPressed: () {
            showDeleteCourseDialog(context, widget.courseModel);
          },
          text: 'Delete Your Course',
          color: Colors.red,
        ),
      ],
    );
  }
}
