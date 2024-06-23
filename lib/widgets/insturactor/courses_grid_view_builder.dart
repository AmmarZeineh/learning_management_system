import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/student/custom_card.dart';

class CoursesGridViewBuilder extends StatelessWidget {
  const CoursesGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(right: 10),
              child: CustomCard(
                text: 'Flutter Advanced Course',
              ),
            );
          },
        ),
      ),
    );
  }
}
