import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/helper/api.dart';
import 'package:learning_management_system/models/course_model.dart';

part 'fetch_courses_cubit_state.dart';

class FetchCoursesCubit extends Cubit<FetchCoursesCubitState> {
  FetchCoursesCubit() : super(FetchCoursesCubitInitial());
  late List<CourseModel> coursesList;
  getAllCourses({required int id}) async {
    coursesList = [];
    emit(FetchCoursesCubitLoading());
    dynamic data = await Api()
        .get(url: '${baseUrl}teacher/viewTeacherCourses/$id', token: null);

    for (var i = 0; i < data['courses'].length; i++) {
      coursesList.add(CourseModel.fromJson(data, i));
    }

    emit(FetchCoursesCubitSuccess());
    return coursesList;
  }
}
