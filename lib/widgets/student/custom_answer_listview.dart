import 'package:flutter/material.dart';
import 'package:coursecraft/smodels/question_model/answer.dart';
import 'package:coursecraft/smodels/question_model/question.dart';
import 'package:coursecraft/smodels/question_model/question_model.dart';
import 'package:coursecraft/widgets/student/custom_answer_widget.dart';

class CustomAnswerListview extends StatelessWidget {
  const CustomAnswerListview({
    super.key,
    required this.answers,
    required this.quizModel,
    required this.question,
  });
  final List<Answer> answers;
  final QuizModel quizModel;
  final Question question;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: answers.length,
      itemBuilder: (context, index) {
        return CustomAnswerWidget(
          answer: answers[index],
          quizModel: quizModel,
          question: question,
        );
      },
    );
  }
}
