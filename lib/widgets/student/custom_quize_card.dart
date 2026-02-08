import 'package:flutter/material.dart';
import 'package:coursecraft/smodels/question_model/question_model.dart';
import 'package:coursecraft/views/student_quiz_view.dart';
import 'package:svg_flutter/svg.dart';

class CustomQuizeCard extends StatelessWidget {
  const CustomQuizeCard({
    super.key,
    required this.quizModel,
    required this.index,
  });
  final QuizModel quizModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        StudentQuizView.id,
        arguments: quizModel,
      ),
      child: SizedBox(
        height: 100,
        child: Card(
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/undraw_business_chat_re_gg4h.svg",
                  width: 80,
                  height: 80,
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Quiz : $index", style: const TextStyle(fontSize: 25)),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
