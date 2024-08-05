import 'package:flutter/material.dart';
import 'package:learning_management_system/models/quiz_model/quiz_model.dart';
import 'package:learning_management_system/widgets/app_scaffold.dart';
import 'package:learning_management_system/widgets/insturactor/question_with_answers_item.dart';

class InstructorQuizDetailsView extends StatelessWidget {
  const InstructorQuizDetailsView({super.key});

  static String id = 'InstructorQuizDetailsView';

  @override
  Widget build(BuildContext context) {
    QuizModel quizModel =
        ModalRoute.of(context)!.settings.arguments as QuizModel;
    return AppScaffold(
        title: 'Quiz Details',
        containerChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'Questions :',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 10000,
              child: ListView.builder(
                itemCount: quizModel.questions!.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return QuestionWithAnswersItem(
                    questionNumber: index + 1,
                    quizModel: quizModel,
                    question: quizModel.questions![index],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
