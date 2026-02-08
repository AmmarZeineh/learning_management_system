import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/sservices/show_rating_service.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ShowRatingService().showRate(courseId: courseModel.courseId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RatingBarIndicator(
            itemSize: 30,
            rating: snapshot.data! / 20,
            itemCount: 5,
            itemBuilder: (context, _) =>
                const Icon(Icons.star, color: Colors.amber),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
