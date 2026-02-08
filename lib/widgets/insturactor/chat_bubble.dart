import 'package:coursecraft/constants.dart';
import 'package:coursecraft/models/message.dart';
import 'package:flutter/material.dart';

class ChatBubbleOne extends StatelessWidget {
  const ChatBubbleOne({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                message.message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Text(
          '${message.createdAt.toDate().hour.toString()}:${message.createdAt.toDate().minute.toString()}',
        ),
      ],
    );
  }
}

class ChatBubbleTwo extends StatelessWidget {
  const ChatBubbleTwo({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(
          '${message.createdAt.toDate().hour.toString()}:${message.createdAt.toDate().minute.toString()}',
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    message.message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
