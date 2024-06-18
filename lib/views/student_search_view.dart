import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/login_signup_scaffold.dart';
import 'package:learning_management_system/widgets/student/custom_search_textfield.dart';
import 'package:learning_management_system/widgets/student/cutom_search_card.dart';

class StudentSearchView extends StatelessWidget {
  const StudentSearchView({super.key});
  static String id = "StudentSearch";

  @override
  Widget build(BuildContext context) {
    return const LoginSignUpScaffold(
      title: "Search",
      containerChild: Column(
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 30,
          ),
          SizedBox(height: 600.0, child: SearchCardListview())
        ],
      ),
    );
  }
}

class SearchCardListview extends StatelessWidget {
  const SearchCardListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const CustomSearchCard();
      },
    );
  }
}
