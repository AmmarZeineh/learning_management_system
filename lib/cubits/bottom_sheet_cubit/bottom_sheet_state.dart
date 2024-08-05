part of 'bottom_sheet_cubit.dart';

sealed class BottomSheetState extends Equatable {
  const BottomSheetState();

  @override
  List<Object> get props => [];
}

final class BottomSheetInitial extends BottomSheetState {}

final class BottomSheetSecond extends BottomSheetState {}

