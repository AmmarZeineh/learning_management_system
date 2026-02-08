import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/models/course_model.dart';

part 'fetch_courses_cubit_state.dart';

class FetchCoursesCubit extends Cubit<FetchCoursesCubitState> {
  FetchCoursesCubit() : super(FetchCoursesCubitInitial());
  late List<CourseModel> coursesList;
  CourseModel? lastCourse;

  Future<List<CourseModel>> getAllCourses({required int id}) async {
    coursesList = [];
    emit(FetchCoursesCubitLoading());
    dynamic data = await Api().put(
      url: '${baseUrl}teacher/viewTeacherCourses/$id',
      token: null,
      body: null,
    );

    for (var i = 0; i < data['courses'].length; i++) {
      coursesList.add(CourseModel.fromJson(data, i));
    }
    if (coursesList.isNotEmpty) {
      lastCourse = coursesList.last;
    }

    emit(FetchCoursesCubitSuccess());
    return coursesList;
  }
}
