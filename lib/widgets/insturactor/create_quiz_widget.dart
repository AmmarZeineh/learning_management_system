import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/cubits/bottom_sheet_quiz_cubit/bottom_sheet_quiz_cubit.dart';
import 'package:coursecraft/cubits/fetch_quizzes_cubit/fetch_quizzes_cubit.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/metods.dart';
import 'package:coursecraft/models/course_model.dart';

class CreateQuizWidget extends StatelessWidget {
  const CreateQuizWidget({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: courseModel.isFinished != 1,
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
                    'Wont be able to create another quiz in this course',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        BlocProvider.of<FetchQuizzesCubit>(context).isYes =
                            false;
                        dynamic response = await Api().post(
                          url: '${baseUrl}teacher/createQuiz',
                          body: {
                            'course_id': courseModel.courseId.toString(),
                            'is_final': 0.toString(),
                          },
                          token: null,
                        );
                        quizId = await response['quiz']['id'];
                        Navigator.pop(context);
                        showQuizBottomSheet(context, courseModel, quizId!);
                        BlocProvider.of<BottomSheetQuizCubit>(
                          context,
                        ).changeBottomSheetUi(index: 0);
                      },
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () async {
                        BlocProvider.of<FetchQuizzesCubit>(context).isYes =
                            true;
                        dynamic response = await Api().post(
                          url: '${baseUrl}teacher/createQuiz',
                          body: {
                            'course_id': courseModel.courseId.toString(),
                            'is_final': 1.toString(),
                          },
                          token: null,
                        );
                        quizId = await response['quiz']['id'];
                        Navigator.pop(context);
                        showQuizBottomSheet(context, courseModel, quizId!);
                        BlocProvider.of<BottomSheetQuizCubit>(
                          context,
                        ).changeBottomSheetUi(index: 0);
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                );
              },
            );
          } on Exception catch (e) {
            showSnackBar(context, e.toString());
          }
        },
        child: const Text('Create New Quiz', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
