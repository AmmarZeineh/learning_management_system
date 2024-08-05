import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/app_scaffold.dart';

class InstructorFilesView extends StatelessWidget {
  const InstructorFilesView({super.key});

  static String id = 'InstructorFilesView';

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
        title: 'Course Files',
        containerChild: Column(
          children: [],
        ));
  }
}
