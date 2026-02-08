part of 'fetch_videos_cubit.dart';

@immutable
sealed class FetchVideosState {}
final class FetchVidoesInitial extends FetchVideosState {}
final class FetchVidoesLoading extends FetchVideosState {}
final class FetchVidoesFailure extends FetchVideosState {
  final String errMessage;

 FetchVidoesFailure({required this.errMessage});
}

final class FetchVideosSuccess extends FetchVideosState {}
