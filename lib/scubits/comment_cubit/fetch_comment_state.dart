part of 'fetch_comment_cubit.dart';

@immutable
sealed class FetchCommentState {}

final class FetchCommentInitial extends FetchCommentState {}
final class FetchCommentLoading extends FetchCommentState {}
final class FetchCommentFailure extends FetchCommentState {
   final String errMessage;

 FetchCommentFailure({required this.errMessage});
}
final class FetchCommentSuccess extends FetchCommentState {}
