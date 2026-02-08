import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';

class AddCommentService {
  Future<void> addComment({
    required String userId,
    required String couresId,
    required String comment,
  }) async {
    await Api().post(
      url: "$kBaseUrl/user/add-comment",
      body: {"user_id": userId, "course_id": couresId, "comment": comment},
      token: null,
    );
  }
}
