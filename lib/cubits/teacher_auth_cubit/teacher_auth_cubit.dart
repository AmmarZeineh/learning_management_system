import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning_management_system/helper/api.dart';

part 'teacher_auth_state.dart';

class TeacherAuthCubit extends Cubit<TeacherAuthState> {
  TeacherAuthCubit() : super(TeacherAuthInitial());

  String? photoLicensePath;

  Future<void> teacherSignUp({
    required String username,
    required String password,
    required String phonenumber,
    required String email,
  }) async {
    emit(TeacherAuthLoading());
    const url = 'http://10.0.2.2:8000/api/user/register';

    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['password'] = password;
    request.fields['phonenumber'] = phonenumber;
    request.fields['email'] = email;
    request.fields['username'] = username;
    request.fields['role'] = 'teacher';

    final imageFile =
        await http.MultipartFile.fromPath('photo_license', photoLicensePath!);
    request.files.add(imageFile);

    final response = await request.send();
    if (response.statusCode == 200) {
      emit(TeacherAuthSuccess());
    } else {
      final responseBody = await response.stream.bytesToString();
      emit(TeacherAuthFailure(errMessage: responseBody));
    }
  }

  Future<void> teacherLogIn({
    required String email,
    required String password,
  }) async {
    emit(TeacherAuthLoading());
    try {
      Api().post(
          url: 'http://10.0.2.2:8000/api/user/login',
          body: {
            'email': email,
            'password': password,
          },
          token: null);
      emit(TeacherAuthSuccess());
    } on Exception catch (e) {
      emit(TeacherAuthFailure(errMessage: e.toString()));
    }
  }
}
