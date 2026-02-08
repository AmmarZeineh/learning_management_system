part of 'fetch_quizzes_cubit.dart';

sealed class FetchQuizzesState extends Equatable {
  const FetchQuizzesState();

  @override
  List<Object> get props => [];
}

final class FetchQuizzesInitial extends FetchQuizzesState {}

final class FetchQuizzesLoading extends FetchQuizzesState {}

final class FetchQuizzesSuccess extends FetchQuizzesState {}

final class FetchQuizzesFailure extends FetchQuizzesState {
  final String err;

  const FetchQuizzesFailure({required this.err});
}
