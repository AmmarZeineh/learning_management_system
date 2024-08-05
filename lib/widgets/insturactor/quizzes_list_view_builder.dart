import 'package:flutter/material.dart';
import 'package:learning_management_system/models/quiz_model/quiz_model.dart';
import 'package:learning_management_system/widgets/insturactor/quiz_item.dart';

class QuizzesListViewBuilder extends StatelessWidget {
  const QuizzesListViewBuilder({super.key, required this.quizzesList});

  final List<QuizModel> quizzesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: ListView.builder(
          itemCount: quizzesList.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: QuizItem(
                  quizModel: quizzesList[index],
                ));
          },
        ),
      ),
    );
  }
}
