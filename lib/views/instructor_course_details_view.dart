import 'package:flutter/material.dart';
import 'package:learning_management_system/models/course_model.dart';
import 'package:learning_management_system/widgets/app_scaffold.dart';
import 'package:learning_management_system/widgets/insturactor/course_details_final_body.dart';
import 'package:learning_management_system/widgets/insturactor/course_details_not_final_body.dart';

class InstructorCourseDetailsView extends StatefulWidget {
  const InstructorCourseDetailsView({super.key});
  static String id = 'InstructorCourseDetailsView';

  @override
  State<InstructorCourseDetailsView> createState() =>
      _InstructorCourseDetailsViewState();
}

class _InstructorCourseDetailsViewState
    extends State<InstructorCourseDetailsView> {
  String? question;
  @override
  Widget build(BuildContext context) {
    CourseModel courseModel =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    return AppScaffold(
        title: 'Course Details',
        containerChild: courseModel.isFinished == 1
            ? CourseDetailsFinalBody(courseModel: courseModel)
            : CourseDetailsNotFinalBody(courseModel: courseModel));
  }
}
