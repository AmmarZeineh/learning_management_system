part of 'fetch_courses_cubit_cubit.dart';

sealed class FetchCoursesCubitState extends Equatable {
  const FetchCoursesCubitState();

  @override
  List<Object> get props => [];
}

final class FetchCoursesCubitInitial extends FetchCoursesCubitState {}

final class FetchCoursesCubitLoading extends FetchCoursesCubitState {}

final class FetchCoursesCubitFailure extends FetchCoursesCubitState {
  final String err;

  const FetchCoursesCubitFailure({required this.err});
}

final class FetchCoursesCubitSuccess extends FetchCoursesCubitState {}
