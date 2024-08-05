import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_sheet_state.dart';

class BottomSheetCubit extends Cubit<BottomSheetState> {
  BottomSheetCubit() : super(BottomSheetInitial());

  int? courseId;
  changeBottomSheetUi({required int index}) {
    if (index == 0) {
      emit(BottomSheetInitial());
    } else if (index == 1) {
      emit(BottomSheetSecond());
    }
  }
}
