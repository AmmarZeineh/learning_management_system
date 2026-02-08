import 'package:bloc/bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/smodels/question_model/question_model.dart';
import 'package:meta/meta.dart';

part 'fetch_my_quizes_state.dart';

class FetchMyQuizesCubit extends Cubit<FetchMyQuizesState> {
  FetchMyQuizesCubit() : super(FetchMyQuizesInitial());
  List<Map<String, dynamic>> answerList = [];
  late List<QuizModel> questions;
  int? selectedIndex;

  Future<List<QuizModel>> getAvailableQuestion({
    required String userid,
    required String courseId,
  }) async {
    questions = [];
    emit(FetchMyQuizesLoading());
    dynamic data = await Api().put(
      url:
          "$kBaseUrl/user/getStudentQuizzesWithQuestionsAndAnswers/$userid/$courseId",
      body: null,
      token: null,
    );

    for (var i = 0; i < data.length; i++) {
      questions.add(QuizModel.fromJson(data[i]));
    }
    emit(FetchMyQuizesSuccess());
    return questions;
  }
}
