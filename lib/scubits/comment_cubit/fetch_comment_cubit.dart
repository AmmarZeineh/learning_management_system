import 'package:bloc/bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/smodels/comment/comment.dart';

import 'package:meta/meta.dart';

part 'fetch_comment_state.dart';

class FetchCommentCubit extends Cubit<FetchCommentState> {
  FetchCommentCubit() : super(FetchCommentInitial());
  late List<Comment> comments = [];
  Future<void> getComment({required String id}) async {
    comments = [];
    emit(FetchCommentLoading());
    dynamic data = await Api().get(
      url: "$kBaseUrl/teacher/course/$id/comments",
      token: null,
    );

    for (var i = 0; i < data["comments"].length; i++) {
      comments.add(
        Comment.fromJson(data["comments"][i]),
      );
    }
    emit(FetchCommentSuccess());
  }
}
