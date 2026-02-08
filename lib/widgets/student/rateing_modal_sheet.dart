import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/scubits/student_auth_cubit/student_auth_cubit.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/sservices/add_rating_service.dart';

class RateingModalSheet extends StatelessWidget {
  const RateingModalSheet({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    String rate;
    // ignore: prefer_const_constructors
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, index) {
              return const Icon(Icons.star, color: Colors.amber);
            },
            onRatingUpdate: (rating) async {
              rating = rating * 20;
              rate = rating.toString();
              rate = rate.substring(0, rate.length - 2);
              int userId = BlocProvider.of<StudentAuthCubit>(
                context,
              ).userModel.studentId;
              try {
                await AddRatingService().addRating(
                  userId: userId.toString(),
                  courseId: courseModel.courseId.toString(),
                  rate: rate,
                );
                // ignore: use_build_context_synchronously
                showSnackBar(context, "Added successfully");
              } on Exception catch (e) {
                showSnackBar(context, e.toString());
              }
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
