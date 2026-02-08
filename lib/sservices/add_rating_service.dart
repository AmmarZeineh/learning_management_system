import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';

class AddRatingService {
  Future<void> addRating({
    required String userId,
    required String courseId,
    required String rate,
  }) async {
    await Api().post(
      url: "$kBaseUrl/user/addRating",
      body: {"user_id": userId, "course_id": courseId, "rating_value": rate},
      token: null,
    );
  }
}
