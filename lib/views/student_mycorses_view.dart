import 'package:flutter/material.dart';
import 'package:coursecraft/widgets/app_scaffold.dart';
import 'package:coursecraft/widgets/student/custom_my_coursescard_listview.dart';

class StudentMycorsesView extends StatelessWidget {
  const StudentMycorsesView({super.key});
  static String id = "StudentMycorses";

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: "My Courses",
      containerChild: SizedBox(height: 700, child: CustomMyCoursCardListView()),
    );
  }
}

//
