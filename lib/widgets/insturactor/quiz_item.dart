import 'package:flutter/material.dart';
import 'package:learning_management_system/metods.dart';
import 'package:learning_management_system/models/quiz_model/quiz_model.dart';
import 'package:learning_management_system/views/instructor_quiz_details_view.dart';
import 'package:svg_flutter/svg.dart';

class QuizItem extends StatelessWidget {
  const QuizItem({super.key, required this.quizModel});

  final QuizModel quizModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, InstructorQuizDetailsView.id,
              arguments: quizModel);
        },
        child: Container(
          height: 130,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/online_learning.svg',
                height: 110,
              ),
              const Spacer(),
              Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    quizModel.courseId.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Questions Number : ${quizModel.questions!.length}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        showDeleteQuizzDialog(context, quizModel);
                      },
                      icon: const Icon(Icons.delete))
                ],
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
