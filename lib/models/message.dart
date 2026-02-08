import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coursecraft/constants.dart';

class Message {
  final String message;
  final int id;
  final String email;
  final Timestamp createdAt;

  Message(this.message, this.id, this.email, this.createdAt);

  factory Message.fromJason(json) {
    return Message(
      json[kMessage],
      json['courseid'],
      json['email'],
      json['createdAt'],
    );
  }
}
