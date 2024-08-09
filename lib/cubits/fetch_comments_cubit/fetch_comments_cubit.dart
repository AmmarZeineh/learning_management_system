import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/helper/api.dart';
import 'package:learning_management_system/models/comment_model/comment_model.dart';

part 'fetch_comments_state.dart';

class FetchCommentsCubit extends Cubit<FetchCommentsState> {
  FetchCommentsCubit() : super(FetchCommentsInitial());

  Future<List<CommentModel>> fetchComments({required int courseId}) async {
    List<CommentModel> commentsList = [];
    dynamic data = await Api()
        .get(url: '${baseUrl}teacher/course/$courseId/comments', token: null);
    for (var i = 0; i < data['comments'].length; i++) {
      commentsList.add(CommentModel.fromJson(data['comments'][i]));
    }
    return commentsList;
  }
}
