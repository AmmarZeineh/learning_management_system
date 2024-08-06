import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/cubits/bottom_sheet_quiz_cubit/bottom_sheet_quiz_cubit.dart';
import 'package:learning_management_system/cubits/fetch_quizzes_cubit/fetch_quizzes_cubit.dart';
import 'package:learning_management_system/helper/api.dart';
import 'package:learning_management_system/helper/show_snack_bar.dart';
import 'package:learning_management_system/metods.dart';
import 'package:learning_management_system/models/course_model.dart';
import 'package:learning_management_system/views/instructor_files_view.dart';
import 'package:learning_management_system/widgets/insturactor/course_details.dart';
import 'package:learning_management_system/widgets/insturactor/custom_elevated_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:svg_flutter/svg.dart';

class CourseDetailsViewBody extends StatefulWidget {
  const CourseDetailsViewBody(
      {super.key, required this.courseModel, required this.rating});

  final CourseModel courseModel;
  final double rating;

  @override
  State<CourseDetailsViewBody> createState() => _CourseDetailsViewBodyState();
}

class _CourseDetailsViewBodyState extends State<CourseDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        const SizedBox(
          height: 20,
        ),
        Visibility(
          visible: widget.courseModel.isFinished != 1,
          child: TextButton(
              onPressed: () async {
                int? quizId;
                try {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Final quiz'),
                          content: const Text(
                              'Wont be able to create another quiz in this course'),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                BlocProvider.of<FetchQuizzesCubit>(context)
                                    .isYes = false;
                                dynamic response = await Api().post(
                                    url: '${baseUrl}teacher/createQuiz',
                                    body: {
                                      'course_id': widget.courseModel.courseId
                                          .toString(),
                                      'is_final': 0.toString()
                                    },
                                    token: null);
                                quizId = await response['quiz']['id'];
                                Navigator.pop(context);
                                showQuizBottomSheet(
                                    context, widget.courseModel, quizId!);
                                BlocProvider.of<BottomSheetQuizCubit>(context)
                                    .changeBottomSheetUi(index: 0);
                              },
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () async {
                                BlocProvider.of<FetchQuizzesCubit>(context)
                                    .isYes = true;
                                dynamic response = await Api().post(
                                    url: '${baseUrl}teacher/createQuiz',
                                    body: {
                                      'course_id': widget.courseModel.courseId
                                          .toString(),
                                      'is_final': 1.toString()
                                    },
                                    token: null);
                                quizId = await response['quiz']['id'];
                                Navigator.pop(context);
                                showQuizBottomSheet(
                                    context, widget.courseModel, quizId!);
                                BlocProvider.of<BottomSheetQuizCubit>(context)
                                    .changeBottomSheetUi(index: 0);
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        );
                      });
                } on Exception catch (e) {
                  showSnackBar(context, e.toString());
                }
              },
              child: const Text(
                'Create New Quiz',
                style: TextStyle(fontSize: 18),
              )),
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
            Column(
              children: [
                SizedBox(
                  width: 150,
                  child: LinearPercentIndicator(
                    barRadius: const Radius.circular(10),
                    lineHeight: 15.0,
                    percent: widget.rating / (50 * 2),
                    backgroundColor: Colors.grey.shade300,
                    progressColor: Colors.yellow,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${widget.rating / (20)} of 5',
                  style: const TextStyle(
                    fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
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
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
