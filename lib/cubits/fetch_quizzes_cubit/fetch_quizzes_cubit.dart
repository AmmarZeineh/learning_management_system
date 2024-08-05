import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/helper/api.dart';
import 'package:learning_management_system/models/quiz_model/quiz_model.dart';

part 'fetch_quizzes_state.dart';

class FetchQuizzesCubit extends Cubit<FetchQuizzesState> {
  FetchQuizzesCubit() : super(FetchQuizzesInitial());
  late List<QuizModel> quizzesList;
  bool isYes = false;
  getAllQuizzes({required int id}) async {
    quizzesList = [];
    emit(FetchQuizzesLoading());
    dynamic data = await Api().get(
        url: '${baseUrl}teacher/getAllQuizzesWithQuestionsAndAnswers/$id',
        token: null);

    for (var i = 0; i < data.length; i++) {
      quizzesList.add(QuizModel.fromJson(data[i]));
    }
    emit(FetchQuizzesSuccess());
    return quizzesList;
  }
}
