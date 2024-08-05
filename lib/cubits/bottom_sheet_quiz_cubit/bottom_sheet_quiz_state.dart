part of 'bottom_sheet_quiz_cubit.dart';

sealed class BottomSheetQuizState extends Equatable {
  const BottomSheetQuizState();

  @override
  List<Object> get props => [];
}

final class BottomSheetQuizInitial extends BottomSheetQuizState {}

final class BottomSheetQuizSecond extends BottomSheetQuizState {}
