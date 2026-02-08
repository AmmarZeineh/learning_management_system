import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';

class ShowRatingService {
  Future<double> showRate({required int courseId}) async {
    dynamic data = await Api().put(
      url: "$kBaseUrl/user/getCourseRating/$courseId",
      body: null,
      token: null,
    );
    double rate = double.parse(data["average_rating"]);
    return rate;
  }
}
