import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';

class BuyCourse {
  Future<void> buyCourse({
    required String userId,
    required String couresId,
  }) async {
    await Api().post(
      url: "$kBaseUrl/user/course/buy",
      body: {"user_id": userId, "course_id": couresId},
      token: null,
    );
  }
}
