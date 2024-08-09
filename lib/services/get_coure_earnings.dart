import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/helper/api.dart';
import 'package:learning_management_system/models/course_model.dart';

class GetCoureEarnings {
  Future<int> getCoureEarnings({required CourseModel courseModel}) async {
    dynamic data = await Api().get(
        url: '${baseUrl}teacher/course/${courseModel.courseId}/earnings',
        token: null);
    int earnings = data['earnings'];
    return earnings;
  }
}
