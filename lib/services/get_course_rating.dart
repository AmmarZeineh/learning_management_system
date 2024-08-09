import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/helper/api.dart';
import 'package:learning_management_system/models/course_model.dart';

class GetCourseRating {
  Future<double> getCourseRating({required CourseModel courseModel}) async {
    dynamic data = await Api().put(
        url: '${baseUrl}user/getCourseRating/${courseModel.courseId}',
        body: null,
        token: null);
    double rating = double.parse(data['average_rating']);
    return rating;
  }
}
