import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.userName,
    required this.value,
    required this.date,
  });

  final String userName;
  final String value;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.face,
        size: 50,
      ),
      title: Row(
        children: [
          Text(userName),
          const Spacer(),
          Text(date.toString().substring(0,10)),
        ],
      ),
      subtitle: Text(value),
    );
  }
}//