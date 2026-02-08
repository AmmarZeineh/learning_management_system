part of 'fetch_my_courses_cubit.dart';

@immutable
sealed class FetchMyCoursesState {}

final class FetchMyCoursesInitial extends FetchMyCoursesState {}


final class FetchMyCourseCubitInitial extends FetchMyCoursesState {}
final class FetchMyCourseCubitLoading extends FetchMyCoursesState {}
final class FetchMyCourseCubitFailure extends FetchMyCoursesState {
  final String errMessage;

 FetchMyCourseCubitFailure({required this.errMessage});
}
final class FetchMyCourseCubitSuccess extends FetchMyCoursesState {}
