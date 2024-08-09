import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/insturactor/course_details_view_body.dart';

class EarningsWidget extends StatelessWidget {
  const EarningsWidget({
    super.key,
    required this.widget,
  });

  final CourseDetailsViewBody widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Course Earnings : ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const Spacer(),
        Text(
          '${widget.earnings.toString()}\$',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          width: 16,
        )
      ],
    );
  }
}
