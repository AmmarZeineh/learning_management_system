import 'package:flutter/material.dart';
import 'package:learning_management_system/metods.dart';
import 'package:learning_management_system/models/course_model.dart';
import 'package:learning_management_system/services/get_coure_earnings.dart';
import 'package:learning_management_system/services/get_course_rating.dart';
import 'package:learning_management_system/widgets/insturactor/comments_section.dart';
import 'package:learning_management_system/widgets/insturactor/course_details.dart';
import 'package:learning_management_system/widgets/insturactor/create_quiz_widget.dart';
import 'package:learning_management_system/widgets/insturactor/view_files_and_delete_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:svg_flutter/svg.dart';

class CourseDetailsViewBody extends StatefulWidget {
  const CourseDetailsViewBody({
    super.key,
    required this.courseModel,
  });

  final CourseModel courseModel;

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
        Row(
          children: [
            const Text(
              'Course Rating : ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Spacer(),
            FutureBuilder(
              future: GetCourseRating()
                  .getCourseRating(courseModel: widget.courseModel),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                          width: 150,
                          child: LinearPercentIndicator(
                            barRadius: const Radius.circular(10),
                            lineHeight: 15.0,
                            percent: snapshot.data! / (50 * 2),
                            backgroundColor: Colors.grey.shade300,
                            progressColor: Colors.yellow,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${snapshot.data! / (20)} of 5',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Text(
              'Course Earnings : ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Spacer(),
            FutureBuilder(
                future: GetCoureEarnings()
                    .getCoureEarnings(courseModel: widget.courseModel),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data.toString()}\$',
                      style: const TextStyle(fontSize: 20),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        ViewFilesAndDeleteCourseButtons(widget: widget),
        const SizedBox(
          height: 20,
        ),
        CommentsSection(
          courseModel: widget.courseModel,
        )
      ],
    );
  }
}
