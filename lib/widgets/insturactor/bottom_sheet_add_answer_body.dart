import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/cubits/bottom_sheet_quiz_cubit/bottom_sheet_quiz_cubit.dart';
import 'package:learning_management_system/cubits/fetch_courses_cubit/fetch_courses_cubit_cubit.dart';
import 'package:learning_management_system/cubits/fetch_quizzes_cubit/fetch_quizzes_cubit.dart';
import 'package:learning_management_system/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:learning_management_system/helper/api.dart';
import 'package:learning_management_system/models/course_model.dart';
import 'package:learning_management_system/widgets/custum_text_field.dart';
import 'package:learning_management_system/widgets/insturactor/custom_elevated_button.dart';

class BottomSheetAddAnswerBody extends StatefulWidget {
  const BottomSheetAddAnswerBody({super.key, required this.courseModel});

  @override
  State<BottomSheetAddAnswerBody> createState() =>
      _BottomSheetAddAnswerBodyState();
  final CourseModel courseModel;
}

class _BottomSheetAddAnswerBodyState extends State<BottomSheetAddAnswerBody> {
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  String? answer;
  List<String> correctOrNot = ['Worng Answer', 'Correct Answer'];
  int isCorrect = 0;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        width: double.infinity,
        height: 300,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Adding Answer',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: 190,
                    child: CustomTextField(
                        controller: fieldText,
                        onChanged: (p0) {
                          answer = p0;
                        },
                        hintText: 'Answer',
                        fillColor: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 175,
                  child: DropdownButtonFormField(
                    items: correctOrNot.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value.toString() == 'Worng Answer') {
                        isCorrect = 0;
                      } else {
                        isCorrect = 1;
                      }
                    },
                    decoration: const InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'Is correct',
                        fillColor: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                      textColor: kPrimaryColor,
                      courseModel: widget.courseModel,
                      onPressed: () async {
                        await Api().post(
                            url: '${baseUrl}teacher/addAnswerToQuestion',
                            body: {
                              'question_id':
                                  BlocProvider.of<BottomSheetQuizCubit>(context)
                                      .questionId
                                      .toString(),
                              'answer_text': answer,
                              'is_correct': isCorrect.toString()
                            },
                            token: null);
                        clearText();
                      },
                      text: 'Add The Answer',
                      color: Colors.white),
                  CustomElevatedButton(
                      textColor: kPrimaryColor,
                      courseModel: widget.courseModel,
                      onPressed: () {
                        clearText();
                        BlocProvider.of<BottomSheetQuizCubit>(context)
                            .changeBottomSheetUi(index: 0);
                      },
                      text: 'Add Another Question',
                      color: Colors.white),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CustomElevatedButton(
                  textColor: kPrimaryColor,
                  courseModel: widget.courseModel,
                  onPressed: () {
                    BlocProvider.of<BottomSheetQuizCubit>(context)
                        .changeBottomSheetUi(index: 0);
                    clearText();
                    int count = 0;
                    if (BlocProvider.of<FetchQuizzesCubit>(context).isYes) {
                      Navigator.of(context).popUntil((_) {
                        BlocProvider.of<FetchCoursesCubit>(context)
                            .coursesList
                            .clear();
                        if (count == 2) {
                          BlocProvider.of<FetchCoursesCubit>(context)
                              .getAllCourses(
                                  id: BlocProvider.of<TeacherAuthCubit>(context)
                                      .teacherModel!
                                      .teacherId!);
                        }
                        return count++ >= 2;
                      });
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  text: 'Finish Quiz Creation',
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
