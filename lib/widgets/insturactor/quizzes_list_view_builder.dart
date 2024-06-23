import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class QuizzesListViewBuilder extends StatelessWidget {
  const QuizzesListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return const Padding(
                padding: EdgeInsets.only(right: 10), child: QuizItem());
          },
        ),
      ),
    );
  }
}

class QuizItem extends StatelessWidget {
  const QuizItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
            const Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Course : Flutter Advanced',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Teacher : Ammar',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Questions : 10',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
