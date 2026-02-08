import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_sheet_quiz_state.dart';

class BottomSheetQuizCubit extends Cubit<BottomSheetQuizState> {
  BottomSheetQuizCubit() : super(BottomSheetQuizInitial());

  int? questionId;
  changeBottomSheetUi({required int index}) {
    if (index == 0) {
      emit(BottomSheetQuizInitial());
    } else if (index == 1) {
      emit(BottomSheetQuizSecond());
    }
  }
}
