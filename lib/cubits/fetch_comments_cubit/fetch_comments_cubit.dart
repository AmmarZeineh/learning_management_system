import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/helper/api.dart';
import 'package:learning_management_system/models/comment_model/comment_model.dart';

part 'fetch_comments_state.dart';

class FetchCommentsCubit extends Cubit<FetchCommentsState> {
  FetchCommentsCubit() : super(FetchCommentsInitial());
  List<CommentModel> commentsList = [];
  void fetchComments({required int courseId}) async {
    commentsList = [];
    emit(FetchCommentsLoading());
    try {
      dynamic data = await Api()
          .get(url: '${baseUrl}teacher/course/$courseId/comments', token: null);
      for (var i = 0; i < data['comments'].length; i++) {
        commentsList.add(CommentModel.fromJson(data['comments'][i]));
      }
      emit(FetchCommentsSuccess());
    } on Exception catch (e) {
      emit(FetchCommentsFailure(err: e.toString()));
    }
  }
}
