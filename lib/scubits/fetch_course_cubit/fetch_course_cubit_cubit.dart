import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';

import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/smodels/course_modal.dart';
part 'fetch_course_cubit_state.dart';

class FetchCourseCubitCubit extends Cubit<FetchCourseCubitState> {
  FetchCourseCubitCubit() : super(FetchCourseCubitInitial());
  late List<CourseModel> courses;
  List<CourseModel> cardCourses = [];
  Future<List<CourseModel>> getAvailableCourses({required String id}) async {
    courses = [];
    emit(FetchCourseCubitLoading());
    dynamic data = await Api().post(
      url: "$kBaseUrl/user/view-available-courses",
      body: {"user_id": id},
      token: null,
    );

    for (var i = 0; i < data["available_courses"].length; i++) {
      courses.add(CourseModel.fromJson(data["available_courses"][i]));
    }
    emit(FetchCourseCubitSuccess());
    return courses;
  }
}
