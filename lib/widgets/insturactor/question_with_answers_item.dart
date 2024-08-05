import 'package:flutter/material.dart';
import 'package:learning_management_system/metods.dart';
import 'package:learning_management_system/models/quiz_model/question.dart';
import 'package:learning_management_system/models/quiz_model/quiz_model.dart';
import 'package:learning_management_system/widgets/insturactor/answers_list_view_builder.dart';

class QuestionWithAnswersItem extends StatefulWidget {
  const QuestionWithAnswersItem({
    super.key,
    required this.quizModel,
    required this.question,
    required this.questionNumber,
  });

  final QuizModel quizModel;
  final Question question;
  final int questionNumber;

  @override
  State<QuestionWithAnswersItem> createState() =>
      _QuestionWithAnswersItemState();
}

class _QuestionWithAnswersItemState extends State<QuestionWithAnswersItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Row(
            children: [
              Text(
                '${widget.questionNumber}. ${widget.question.questionText}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              IconButton(
                onPressed: () async {
                 await showDeleteQuestionDialog(context, widget.question);
                },
                icon: const Icon(Icons.delete),
              )
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: AnswersListViewBuilder(
            question: widget.question,
          ),
        ),
      ],
    );
  }
}
