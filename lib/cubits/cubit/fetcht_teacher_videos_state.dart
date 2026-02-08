part of 'fetcht_teacher_videos_cubit.dart';

sealed class FetchtTeacherVideosState extends Equatable {
  const FetchtTeacherVideosState();

  @override
  List<Object> get props => [];
}

final class FetchtTeacherVideosInitial extends FetchtTeacherVideosState {}

final class FetchtTeacherVideosLoading extends FetchtTeacherVideosState {}

final class FetchtTeacherVideosFailure extends FetchtTeacherVideosState {
  final String err;

  const FetchtTeacherVideosFailure({required this.err});
}

final class FetchtTeacherVideosSuccess extends FetchtTeacherVideosState {}
