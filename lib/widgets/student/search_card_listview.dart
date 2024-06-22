import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/student/cutom_search_card.dart';

class SearchCardListview extends StatelessWidget {
  const SearchCardListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const CustomSearchCard();
      },
    );
  }
}