import 'package:bloc/bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:meta/meta.dart';

part 'fetch_my_courses_state.dart';

class FetchMyCoursesCubit extends Cubit<FetchMyCoursesState> {
  FetchMyCoursesCubit() : super(FetchMyCoursesInitial());

  late List<CourseModel> myCourses;
  Future<List<CourseModel>> getMyCourses({required String id}) async {
    myCourses = [];
    emit(FetchMyCourseCubitLoading());
    dynamic data = await Api().post(
      url: "$kBaseUrl/user/view-enrolled-courses",
      body: {"user_id": id},
      token: null,
    );

    for (var i = 0; i < data["courses"].length; i++) {
      myCourses.add(CourseModel.fromJson(data["courses"][i]));
    }
    emit(FetchMyCourseCubitSuccess());
    return myCourses;
  }
}
