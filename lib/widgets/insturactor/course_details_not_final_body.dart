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
import 'package:svg_flutter/svg.dart';

class CourseDetailsNotFinalBody extends StatelessWidget {
  const CourseDetailsNotFinalBody({super.key, required this.courseModel});

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
          height: 40,
        ),
        Row(
          children: [
            CustomElevatedButton(
              textColor: Colors.white,
              color: kPrimaryColor,
              text: 'Create New Quizz',
              courseModel: courseModel,
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
                                      'course_id':
                                          courseModel.courseId.toString(),
                                      'is_final': 0.toString()
                                    },
                                    token: null);
                                quizId = await response['quiz']['id'];
                                Navigator.pop(context);
                                showQuizBottomSheet(
                                    context, courseModel, quizId!);
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
                                      'course_id':
                                          courseModel.courseId.toString(),
                                      'is_final': 1.toString()
                                    },
                                    token: null);
                                quizId = await response['quiz']['id'];
                                Navigator.pop(context);
                                showQuizBottomSheet(
                                    context, courseModel, quizId!);
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
        const SizedBox(
          height: 20,
        ),
        CustomElevatedButton(
          textColor: Colors.white,
          courseModel: courseModel,
          onPressed: () {
            showDeleteCourseDialog(context, courseModel);
          },
          text: 'Delete Your Course',
          color: Colors.red,
        ),
      ],
    );
  }
}
