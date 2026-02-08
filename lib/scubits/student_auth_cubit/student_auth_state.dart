part of 'student_auth_cubit.dart';

@immutable
sealed class StudentAuthState {}

final class StudentAuthInitial extends StudentAuthState {}
final class StudentSignLoading extends StudentAuthState {}
final class StudentSignFailure extends StudentAuthState {
  final String errMessage;

  StudentSignFailure({required this.errMessage});
}
final class StudentSignSuccess extends StudentAuthState {}





final class StudentLogLoading extends StudentAuthState {}
final class StudentLogFailure extends StudentAuthState {
  final String errMessage;

  StudentLogFailure({required this.errMessage});
}
final class StudentLogSuccess extends StudentAuthState {}