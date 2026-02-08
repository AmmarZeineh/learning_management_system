import 'package:flutter/material.dart';
import 'package:coursecraft/models/course_model.dart';
import 'package:coursecraft/widgets/app_scaffold.dart';
import 'package:coursecraft/widgets/insturactor/course_details_view_body.dart';

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
      containerChild: CourseDetailsViewBody(courseModel: courseModel),
    );
  }
}
