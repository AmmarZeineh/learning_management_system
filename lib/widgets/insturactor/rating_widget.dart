import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/insturactor/course_details_view_body.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.widget,
  });

  final CourseDetailsViewBody widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Course Rating : ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const Spacer(),
        Column(
          children: [
            SizedBox(
              width: 150,
              child: LinearPercentIndicator(
                barRadius: const Radius.circular(10),
                lineHeight: 15.0,
                percent: widget.rating / (50 * 2),
                backgroundColor: Colors.grey.shade300,
                progressColor: Colors.yellow,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${widget.rating / (20)} of 5',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
