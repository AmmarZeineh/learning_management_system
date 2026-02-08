part of 'fetch_my_quizes_cubit.dart';

@immutable
sealed class FetchMyQuizesState {}

final class FetchMyQuizesInitial extends FetchMyQuizesState {}
final class FetchMyQuizesLoading extends FetchMyQuizesState {}
final class FetchMyQuizesFailure extends FetchMyQuizesState {
  final String errMessage;

 FetchMyQuizesFailure({required this.errMessage});
}
final class FetchMyQuizesSuccess extends FetchMyQuizesState {}