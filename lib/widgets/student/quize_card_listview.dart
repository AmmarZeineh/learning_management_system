import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/student/custom_quize_card.dart';

class CustomQuizeCardListView extends StatelessWidget {
  const CustomQuizeCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const CustomQuizeCard();
      },
    );
    
  }
}