import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/models/course_model.dart';

class CreateGroupService {
  Future<void> createGroupService({
    required CourseModel courseModel,
    required dContext,
  }) async {
    await Api().post(
      url: '${baseUrl}teacher/createGroup',
      body: {
        'group_name': 'Course Group',
        'course_id': courseModel.courseId.toString(),
        'teacher_id': BlocProvider.of<TeacherAuthCubit>(
          dContext,
        ).teacherModel!.teacherId!.toString(),
      },
      token: null,
    );
  }
}
