import 'package:flutter/material.dart';
import 'package:learning_management_system/metods.dart';
import 'package:learning_management_system/models/comment_model/comment_model.dart';
import 'package:learning_management_system/models/course_model.dart';
import 'package:learning_management_system/widgets/insturactor/comments_section.dart';
import 'package:learning_management_system/widgets/insturactor/course_details.dart';
import 'package:learning_management_system/widgets/insturactor/create_quiz_widget.dart';
import 'package:learning_management_system/widgets/insturactor/earnings_widget.dart';
import 'package:learning_management_system/widgets/insturactor/rating_widget.dart';
import 'package:learning_management_system/widgets/insturactor/view_files_and_delete_button.dart';
import 'package:svg_flutter/svg.dart';

class CourseDetailsViewBody extends StatefulWidget {
  const CourseDetailsViewBody(
      {super.key,
      required this.courseModel,
      required this.rating,
      required this.commentsList,
      required this.earnings});

  final CourseModel courseModel;
  final double rating;
  final List<CommentModel> commentsList;
  final int earnings;

  @override
  State<CourseDetailsViewBody> createState() => _CourseDetailsViewBodyState();
}

class _CourseDetailsViewBodyState extends State<CourseDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        const SizedBox(
          height: 20,
        ),
        CreateQuizWidget(courseModel: widget.courseModel),
        SvgPicture.asset(
          'assets/images/online_learning.svg',
          height: 230,
        ),
        const SizedBox(
          height: 30,
        ),
        CourseDetails(
          title: 'Course Name',
          subTitle: widget.courseModel.courseName,
          onPressed: () async {
            showEditDialog(context,
                courseModel: widget.courseModel,
                hintText: 'Course Name',
                changingValue: 'course_name');
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CourseDetails(
          title: 'Course Type',
          subTitle: widget.courseModel.courseType,
          onPressed: () async {
            showEditDialog(context,
                courseModel: widget.courseModel,
                hintText: 'Course Type',
                changingValue: 'course_type');
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CourseDetails(
          title: 'Course Description',
          subTitle: widget.courseModel.courseDes,
          onPressed: () async {
            showEditDialog(context,
                courseModel: widget.courseModel,
                hintText: 'Course Description',
                changingValue: 'course_description');
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CourseDetails(
          title: 'Course Price',
          subTitle: widget.courseModel.coursePrice.toString(),
          onPressed: () async {
            showEditDialog(context,
                courseModel: widget.courseModel,
                hintText: 'Course Price',
                changingValue: 'course_price');
          },
        ),
        const SizedBox(
          height: 20,
        ),
        RatingWidget(widget: widget),
        const SizedBox(
          height: 20,
        ),
        EarningsWidget(widget: widget),
        const SizedBox(
          height: 40,
        ),
        ViewFilesAndDeleteCourseButtons(widget: widget),
        const SizedBox(
          height: 20,
        ),
        CommentsSection(commentsList: widget.commentsList)
      ],
    );
  }
}
