import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/smodels/user_model.dart';

part 'student_auth_state.dart';

class StudentAuthCubit extends Cubit<StudentAuthState> {
  late UserModel userModel;

  String? email;
  StudentAuthCubit() : super(StudentAuthInitial());

  Future<dynamic> login({required email, required password, context}) async {
    try {
      emit(StudentLogLoading());
      Map<String, dynamic> data = await Api().post(
        url: "$kBaseUrl/user/login/",
        body: {
          "email": email,
          "password": password,
        },
        token: null,
      );
      this.email = email;
      UserModel user = UserModel.fromJson(data);
      emit(StudentLogSuccess());
      return user;
    } on Exception catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signUp({
    required email,
    required phone,
    required username,
    required password,
  }) async {
    emit(StudentSignLoading());
    await Api().post(
      url: "$kBaseUrl/user/register",
      body: {
        "email": email,
        "password": password,
        "phonenumber": phone,
        "username": username,
        "role": "student",
      },
      token: '',
    );
    this.email = email;
    emit(StudentSignSuccess());
  }

  Future<void> studentLogout({required String token}) async {
    await Api().post(url: '$kBaseUrl/user/logout', body: {}, token: token);
  }
}
