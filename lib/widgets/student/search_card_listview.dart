import 'package:flutter/material.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/widgets/student/cutom_search_card.dart';

class SearchCardListview extends StatelessWidget {
  const SearchCardListview({super.key, required this.courses});
  final List<CourseModel> courses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (courses.isNotEmpty) {
          return CustomSearchCard(courseModel: courses[index]);
        } else {
          return const Text("");
        }
      },
    );
  }
}
