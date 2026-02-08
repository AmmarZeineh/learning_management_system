part of 'teacher_auth_cubit.dart';

@immutable
sealed class TeacherAuthState {}

final class TeacherAuthInitial extends TeacherAuthState {}

final class TeacherSignUpLoading extends TeacherAuthState {}

final class TeacherLoginLoading extends TeacherAuthState {}

final class TeacherSignUpSuccess extends TeacherAuthState {}

final class TeacherLoginSuccess extends TeacherAuthState {}

final class TeacherSignUpFailure extends TeacherAuthState {
  final String errMessage;

  TeacherSignUpFailure({required this.errMessage});
}

final class TeacherLoginFailure extends TeacherAuthState {
  final String errMessage;

  TeacherLoginFailure({required this.errMessage});
}
//