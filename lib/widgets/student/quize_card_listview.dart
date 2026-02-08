import 'package:flutter/material.dart';
import 'package:coursecraft/smodels/question_model/question_model.dart';
import 'package:coursecraft/widgets/student/custom_quize_card.dart';

class CustomQuizeCardListView extends StatelessWidget {
  const CustomQuizeCardListView({super.key, required this.quizzes});
  final List<QuizModel> quizzes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quizzes.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CustomQuizeCard(index: index + 1, quizModel: quizzes[index]);
      },
    );
  }
}//