part of 'teacher_auth_cubit.dart';

@immutable
sealed class TeacherAuthState {}

final class TeacherAuthInitial extends TeacherAuthState {}

final class TeacherAuthLoading extends TeacherAuthState {}

final class TeacherAuthSuccess extends TeacherAuthState {}

final class TeacherAuthFailure extends TeacherAuthState {
  final String errMessage;

  TeacherAuthFailure({required this.errMessage});
}
//