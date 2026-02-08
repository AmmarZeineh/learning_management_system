part of 'upload_files_and_videos_cubit.dart';

sealed class UploadFilesAndVideosState extends Equatable {
  const UploadFilesAndVideosState();

  @override
  List<Object> get props => [];
}

final class UploadFilesAndVideosInitial extends UploadFilesAndVideosState {}

final class UploadFilesAndVideosLoading extends UploadFilesAndVideosState {}

final class UploadFilesAndVideosFailure extends UploadFilesAndVideosState {
  final String errM;

  const UploadFilesAndVideosFailure({required this.errM});
}

final class UploadFilesAndVideosSuccess extends UploadFilesAndVideosState {}
