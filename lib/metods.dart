import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/cubits/bottom_sheet_quiz_cubit/bottom_sheet_quiz_cubit.dart';
import 'package:learning_management_system/cubits/fetch_courses_cubit/fetch_courses_cubit_cubit.dart';
import 'package:learning_management_system/cubits/fetch_quizzes_cubit/fetch_quizzes_cubit.dart';
import 'package:learning_management_system/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:learning_management_system/helper/api.dart';
import 'package:learning_management_system/helper/show_snack_bar.dart';
import 'package:learning_management_system/models/course_model.dart';
import 'package:learning_management_system/models/quiz_model/answer.dart';
import 'package:learning_management_system/models/quiz_model/question.dart';
import 'package:learning_management_system/models/quiz_model/quiz_model.dart';
import 'package:learning_management_system/views/instructor_home_view.dart';
import 'package:learning_management_system/widgets/custum_text_field.dart';
import 'package:learning_management_system/widgets/insturactor/bottom_sheet_add_answer_body.dart';
import 'package:learning_management_system/widgets/insturactor/bottom_sheet_add_question_body.dart';

Future<void> showQuizBottomSheet(
    BuildContext context, CourseModel courseModel, int quizId) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return BlocBuilder<BottomSheetQuizCubit, BottomSheetQuizState>(
          builder: (context, state) {
        if (state is BottomSheetQuizInitial) {
          return BottomSheetAddQuestionBody(
              courseModel: courseModel, quizId: quizId);
        }
        return BottomSheetAddAnswerBody(courseModel: courseModel);
      });
    },
  );
}

Future<dynamic> showDeleteCourseDialog(
    BuildContext context, CourseModel courseModel) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Delete the course?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await Api().put(
                      url:
                          '${baseUrl}teacher/deleteCourse/${courseModel.courseId}',
                      body: {},
                      token: null);
                  Navigator.pushNamed(context, InstructorHomeView.id,
                      arguments:
                          await BlocProvider.of<FetchCoursesCubit>(context)
                              .getAllCourses(
                                  id: BlocProvider.of<TeacherAuthCubit>(context)
                                      .teacherModel!
                                      .teacherId!));
                } on Exception catch (e) {
                  showSnackBar(context, e.toString());
                }
              },
              child: const Text('Yes'),
            ),
          ],
        );
      });
}

Future<dynamic> showEditDialog(BuildContext context,
    {required CourseModel courseModel,
    required String changingValue,
    required String hintText}) {
  return showDialog(
      context: context,
      builder: (context) {
        String? newValue;
        return AlertDialog(
          backgroundColor: kPrimaryColor,
          title: const Row(
            children: [
              Text(
                'Edit Course Details',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                width: 80,
              )
            ],
          ),
          content: CustomTextField(
            hintText: hintText,
            fillColor: Colors.white,
            onChanged: (p0) {
              newValue = p0;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await Api().post(
                      url:
                          '${baseUrl}teacher/editCourse/${courseModel.courseId}',
                      body: {changingValue: newValue},
                      token: null);
                  showSnackBar(context, 'Change Done');
                  await BlocProvider.of<FetchCoursesCubit>(context)
                      .getAllCourses(
                          id: BlocProvider.of<TeacherAuthCubit>(context)
                              .teacherModel!
                              .teacherId!);
                  Navigator.pop(context);
                } on Exception catch (e) {
                  showSnackBar(context, e.toString());
                }
              },
              child: const Text('Yes'),
            ),
          ],
        );
      });
}

Future<dynamic> showDeleteQuestionDialog(
    BuildContext context, Question question) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Delete the Question?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await Api().put(
                      url: '${baseUrl}teacher/deleteQuestion/${question.id}',
                      body: null,
                      token: null);

                  await BlocProvider.of<FetchQuizzesCubit>(context)
                      .getAllQuizzes(
                          id: BlocProvider.of<TeacherAuthCubit>(context)
                              .teacherModel!
                              .teacherId!);
                  Navigator.pop(context);
                } on Exception catch (e) {
                  showSnackBar(context, e.toString());
                }
              },
              child: const Text('Yes'),
            ),
          ],
        );
      });
}

Future<dynamic> showDeleteAnswerDialog(BuildContext context, Answer answer) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Alert'),
        content: const Text('Delete the Answer?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () async {
              try {
                await Api().put(
                    url: '${baseUrl}teacher/deleteAnswer/${answer.id}',
                    body: null,
                    token: null);

                await BlocProvider.of<FetchQuizzesCubit>(context).getAllQuizzes(
                    id: BlocProvider.of<TeacherAuthCubit>(context)
                        .teacherModel!
                        .teacherId!);
                Navigator.pop(context);
              } on Exception catch (e) {
                showSnackBar(context, e.toString());
              }
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}

Future<dynamic> showDeleteQuizzDialog(BuildContext context, QuizModel quiz) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Delete the Quiz?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await Api().put(
                      url: '${baseUrl}teacher/deleteQuiz/${quiz.id}',
                      body: null,
                      token: null);

                  await BlocProvider.of<FetchQuizzesCubit>(context)
                      .getAllQuizzes(
                          id: BlocProvider.of<TeacherAuthCubit>(context)
                              .teacherModel!
                              .teacherId!);
                } on Exception catch (e) {
                  showSnackBar(context, e.toString());
                }
              },
              child: const Text('Yes'),
            ),
          ],
        );
      });
}
