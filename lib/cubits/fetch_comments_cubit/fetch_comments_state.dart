part of 'fetch_comments_cubit.dart';

sealed class FetchCommentsState extends Equatable {
  const FetchCommentsState();

  @override
  List<Object> get props => [];
}

final class FetchCommentsInitial extends FetchCommentsState {}

final class FetchCommentsLoading extends FetchCommentsState {}

final class FetchCommentsSuccess extends FetchCommentsState {}

final class FetchCommentsFailure extends FetchCommentsState {
  final String err;

  const FetchCommentsFailure({required this.err});
}
