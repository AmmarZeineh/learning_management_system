import 'package:flutter/material.dart';
import 'package:coursecraft/smodels/question_model/question.dart';
import 'package:coursecraft/smodels/question_model/question_model.dart';
import 'package:coursecraft/widgets/student/custom_answer_listview.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
    required this.index,
    required this.quizModel,
  });
  final Question question;
  final int index;
  final QuizModel quizModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${index}_ ${question.questionText!}",
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 150,
              child: CustomAnswerListview(
                question: question,
                quizModel: quizModel,
                answers: question.answers!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
