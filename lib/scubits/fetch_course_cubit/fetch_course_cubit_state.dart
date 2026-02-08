part of 'fetch_course_cubit_cubit.dart';

@immutable
sealed class FetchCourseCubitState {}

final class FetchCourseCubitInitial extends FetchCourseCubitState {}
final class FetchCourseCubitLoading extends FetchCourseCubitState {}
final class FetchCourseCubitFailure extends FetchCourseCubitState {
  final String errMessage;

 FetchCourseCubitFailure({required this.errMessage});
}
final class FetchCourseCubitSuccess extends FetchCourseCubitState {}
