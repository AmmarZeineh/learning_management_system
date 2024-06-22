import 'package:flutter/material.dart';

import 'package:learning_management_system/widgets/student/custom_card.dart';

class QuizesListView extends StatelessWidget {
  const QuizesListView({super.key});
  final List<String> quizes = const [
    "Quize 1",
    "Quize 2",
    "Quize 3",
    "Quize 4"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: quizes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomCard(
              text: quizes[index],
            ),
          );
        },
      ),
    );
  }
}
