import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/models/course_model.dart';

class GetCoureEarnings {
  Future<int> getCoureEarnings({required CourseModel courseModel}) async {
    dynamic data = await Api().get(
      url: '${baseUrl}teacher/course/${courseModel.courseId}/earnings',
      token: null,
    );
    int earnings = data['earnings'];
    return earnings;
  }
}
