import 'package:flutter/material.dart';
import 'package:coursecraft/smodels/question_model/question_model.dart';
import 'package:coursecraft/widgets/student/question_card.dart';

class CustomQuestionCardListView extends StatelessWidget {
  const CustomQuestionCardListView({super.key, required this.quizModel});
  final QuizModel quizModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quizModel.questions!.length,
      itemBuilder: (context, index) {
        return QuestionCard(
          quizModel: quizModel,
          index: index + 1,
          question: quizModel.questions![index],
        );
      },
    );
  }
}
