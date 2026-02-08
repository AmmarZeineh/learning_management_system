import 'package:coursecraft/constants.dart';
import 'package:coursecraft/cubits/bottom_sheet_quiz_cubit/bottom_sheet_quiz_cubit.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/widgets/custum_text_field.dart';
import 'package:coursecraft/widgets/insturactor/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/course_model.dart';

class BottomSheetAddQuestionBody extends StatefulWidget {
  const BottomSheetAddQuestionBody({
    super.key,
    required this.courseModel,
    required this.quizId,
  });

  @override
  State<BottomSheetAddQuestionBody> createState() =>
      _BottomSheetAddQuestionBodyState();
  final CourseModel courseModel;
  final int quizId;
}

class _BottomSheetAddQuestionBodyState
    extends State<BottomSheetAddQuestionBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? question;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        width: double.infinity,
        height: 220.0,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Adding Questions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                onChanged: (p0) {
                  question = p0;
                },
                hintText: 'Question Name',
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CustomElevatedButton(
                    textColor: kPrimaryColor,
                    courseModel: widget.courseModel,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {});
                        try {
                          dynamic response = await Api().post(
                            url: '${baseUrl}teacher/createQuestion',
                            body: {
                              'quiz_id': widget.quizId.toString(),
                              'question_text': question,
                            },
                            token: null,
                          );
                          BlocProvider.of<BottomSheetQuizCubit>(
                            context,
                          ).questionId = response['0']['id'];
                          BlocProvider.of<BottomSheetQuizCubit>(
                            context,
                          ).changeBottomSheetUi(index: 1);
                          showSnackBar(context, 'Question Added Successfully');
                        } on Exception catch (e) {
                          showSnackBar(context, e.toString());
                        }
                      }
                    },
                    text: 'Adding Answers',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
