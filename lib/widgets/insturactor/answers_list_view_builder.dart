import 'package:coursecraft/metods.dart';
import 'package:coursecraft/smodels/question_model/question.dart';
import 'package:flutter/material.dart';

class AnswersListViewBuilder extends StatelessWidget {
  const AnswersListViewBuilder({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      itemCount: question.answers!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Container(
            width: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -5,
                  right: -5,
                  child: IconButton(
                    onPressed: () async {
                      await showDeleteAnswerDialog(
                        context,
                        question.answers![index],
                      );
                    },
                    icon: const Icon(Icons.delete, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    question.answers![index].answerText!,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
