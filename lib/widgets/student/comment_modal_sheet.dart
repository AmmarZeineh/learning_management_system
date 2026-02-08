import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/scubits/student_auth_cubit/student_auth_cubit.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/sservices/add_comment.dart';
import 'package:coursecraft/widgets/custom_button.dart';
import 'package:coursecraft/widgets/custum_text_field.dart';

// ignore: must_be_immutable
class CommentModalSheet extends StatelessWidget {
  CommentModalSheet({super.key, required this.courseModel});

  final CourseModel courseModel;
  late String comment;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          CustomTextField(
            hintText: "Comment",
            onChanged: (value) {
              comment = value;
            },
            fillColor: Colors.white,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                title: "Add",
                textColor: Colors.white,
                buttonColor: kPrimaryColor,
                onTap: () async {
                  try {
                    int id = BlocProvider.of<StudentAuthCubit>(
                      context,
                    ).userModel.studentId;
                    await AddCommentService().addComment(
                      userId: id.toString(),
                      couresId: courseModel.courseId.toString(),
                      comment: comment,
                    );
                  } on Exception catch (e) {
                    showSnackBar(context, e.toString());
                  }
                  Navigator.pop(context);
                  showSnackBar(context, "Added successfully");
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
