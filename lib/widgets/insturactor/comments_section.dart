import 'package:flutter/material.dart';
import 'package:learning_management_system/models/comment_model/comment_model.dart';
import 'package:learning_management_system/widgets/insturactor/comment_item.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({super.key, required this.commentsList});

  final List<CommentModel> commentsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              'Comments :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Spacer()
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SizedBox(
              height: 100,
              child: CommentItem(
                userName: commentsList[index].studentCourse!.user!.username!,
                value: commentsList[index].value!,
                date: commentsList[index].createdAt!,
              ),
            );
          },
          itemCount: commentsList.length,
        )
      ],
    );
  }
}
