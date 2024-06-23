import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/student/courses_list_view.dart';

class ListViewBuilderWithTitle extends StatelessWidget {
  const ListViewBuilderWithTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'My Courses',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        CoursesListView()
      ],
    );
  }
}
