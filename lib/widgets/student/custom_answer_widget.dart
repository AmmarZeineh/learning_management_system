import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/scubits/fetch_quizes_cubit/fetch_my_quizes_cubit.dart';
import 'package:coursecraft/smodels/question_model/answer.dart';
import 'package:coursecraft/smodels/question_model/question.dart';
import 'package:coursecraft/smodels/question_model/question_model.dart';

class CustomAnswerWidget extends StatefulWidget {
  const CustomAnswerWidget({
    super.key,
    required this.answer,
    required this.quizModel,
    required this.question,
  });
  final Answer answer;
  final QuizModel quizModel;
  final Question question;

  @override
  State<CustomAnswerWidget> createState() => _CustomAnswerWidgetState();
}

class _CustomAnswerWidgetState extends State<CustomAnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () async {
          if (BlocProvider.of<FetchMyQuizesCubit>(
            context,
          ).answerList.isNotEmpty) {
            for (
              int i = 0;
              i <
                  BlocProvider.of<FetchMyQuizesCubit>(
                    context,
                  ).answerList.length;
              i++
            ) {
              if (BlocProvider.of<FetchMyQuizesCubit>(
                    context,
                  ).answerList[i]['question_id'] ==
                  widget.question.id) {
                BlocProvider.of<FetchMyQuizesCubit>(context).answerList.remove(
                  BlocProvider.of<FetchMyQuizesCubit>(context).answerList[i],
                );
              }
            }
          }
          BlocProvider.of<FetchMyQuizesCubit>(context).answerList.add({
            "question_id": widget.question.id,
            "answer_id": widget.answer.id,
          });
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(5),
          child: Text(
            widget.answer.answerText!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
