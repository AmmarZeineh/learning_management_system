import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/smodels/course_modal.dart';

class GetAvaliableCoursesSevice {
  Future<List<CourseModel>> getAvailableCourses({required String id}) async {
    dynamic data = await Api().post(
      url: "$kBaseUrl/user/view-available-courses",
      body: {"user_id": id},
      token: null,
    );
    List<CourseModel> courses = [];
    for (var i = 0; i < data["available_courses"].length; i++) {
      courses.add(CourseModel.fromJson(data["available_courses"][i]));
    }

    return courses;
  }
}
