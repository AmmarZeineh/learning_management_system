import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/models/course_model.dart';

class GetCourseRating {
  Future<double> getCourseRating({required CourseModel courseModel}) async {
    dynamic data = await Api().put(
      url: '${baseUrl}user/getCourseRating/${courseModel.courseId}',
      body: null,
      token: null,
    );
    double rating = double.parse(data['average_rating']);
    return rating;
  }
}
