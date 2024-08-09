import 'package:flutter/material.dart';
import 'package:learning_management_system/models/comment_model/comment_model.dart';
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
    double rating = arguments[1];
    List<CommentModel> commentsList = arguments[2];
    int earnings = arguments[3];

    return AppScaffold(
      title: 'Course Details',
      containerChild: CourseDetailsViewBody(
        earnings: earnings,
        courseModel: courseModel,
        rating: rating,
        commentsList: commentsList,
      ),
    );
  }
}
