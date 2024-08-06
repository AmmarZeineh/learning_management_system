
import 'package:flutter/material.dart';
import 'package:learning_management_system/models/course_model.dart';
import 'package:learning_management_system/widgets/app_scaffold.dart';
import 'package:learning_management_system/widgets/insturactor/course_details_view_body.dart';

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
    List<dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    CourseModel courseModel = arguments[0];
    double rating = double.parse(arguments[1]['average_rating']);
    return AppScaffold(
        title: 'Course Details',
        containerChild: SingleChildScrollView(
            child: CourseDetailsViewBody(
          courseModel: courseModel,
          rating: rating,
        )));
  }
}
