import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coursecraft/models/message.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/models/course_model.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<Message> allMessagesList = [];

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  void getMessages({required CourseModel courseModel}) {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      allMessagesList.clear();
      for (var doc in event.docs) {
        Message message = Message.fromJason(doc);
        if(message.id == courseModel.courseId) {
          allMessagesList.add(message);
        }
      }
      emit(ChatSuccess());
    });
  }

  void sendMessages(
      {required String message,
      required String email,
      required CourseModel courseModel}) async {
    await messages.add({
      kMessage: message,
      kCreatedAt: DateTime.now(),
      'email': email,
      'courseid': courseModel.courseId
    });
  }
}
