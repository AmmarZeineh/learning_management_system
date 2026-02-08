import 'package:bloc/bloc.dart';
import 'package:coursecraft/smodels/question_model/question_model.dart';
import 'package:equatable/equatable.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';

part 'fetch_quizzes_state.dart';

class FetchQuizzesCubit extends Cubit<FetchQuizzesState> {
  FetchQuizzesCubit() : super(FetchQuizzesInitial());
  late List<QuizModel> quizzesList;
  bool isYes = false;
  Future<List<QuizModel>> getAllQuizzes({required int id}) async {
    quizzesList = [];
    emit(FetchQuizzesLoading());
    dynamic data = await Api().put(
      body: null,
      url: '${baseUrl}teacher/getAllQuizzesWithQuestionsAndAnswers/$id',
      token: null,
    );

    for (var i = 0; i < data.length; i++) {
      quizzesList.add(QuizModel.fromJson(data[i]));
    }
    emit(FetchQuizzesSuccess());
    return quizzesList;
  }
}
