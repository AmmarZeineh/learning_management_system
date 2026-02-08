import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/smodels/course_modal.dart';

class SearchService {
  Future<dynamic> searchCourses({required String term, context}) async {
    try {
      List<CourseModel> courseList = [];

      dynamic data = await Api().post(
        url: "$kBaseUrl/user/search-courses",
        body: {"search_term": term},
        token: null,
      );

      for (var i = 0; i < data["courses"].length; i++) {
        courseList.add(CourseModel.fromJson(data["courses"][i]));
      }

      return courseList;
    } on Exception catch (e) {
      return showSnackBar(context, e.toString());
    }
  }
}
