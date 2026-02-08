import 'package:coursecraft/cubits/fetch_comments_cubit/fetch_comments_cubit.dart';
import 'package:coursecraft/widgets/insturactor/comment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/course_model.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetchCommentsCubit>(
      context,
    ).fetchComments(courseId: courseModel.courseId);
    return Column(
      children: [
        const Row(
          children: [
            Text(
              'Comments :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Spacer(),
          ],
        ),
        const SizedBox(height: 10),
        BlocBuilder<FetchCommentsCubit, FetchCommentsState>(
          builder: (context, state) {
            if (state is FetchCommentsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchCommentsFailure) {
              return Center(child: Text(state.err));
            }
            if (BlocProvider.of<FetchCommentsCubit>(
              context,
            ).commentsList.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 100,
                    child: CommentItem(
                      userName: BlocProvider.of<FetchCommentsCubit>(
                        context,
                      ).commentsList[index].studentCourse!.user!.username!,
                      value: BlocProvider.of<FetchCommentsCubit>(
                        context,
                      ).commentsList[index].value!,
                      date: BlocProvider.of<FetchCommentsCubit>(
                        context,
                      ).commentsList[index].createdAt!,
                    ),
                  );
                },
                itemCount: BlocProvider.of<FetchCommentsCubit>(
                  context,
                ).commentsList.length,
              );
            } else {
              return const Text(
                'No Comments Yet',
                style: TextStyle(fontSize: 18),
              );
            }
          },
        ),
      ],
    );
  }
}
