import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/scubits/fetch_quizes_cubit/fetch_my_quizes_cubit.dart';
import 'package:coursecraft/scubits/student_auth_cubit/student_auth_cubit.dart';
import 'package:coursecraft/smodels/question_model/question_model.dart';
import 'package:coursecraft/widgets/app_scaffold.dart';
import 'package:coursecraft/widgets/student/custom_questioncard_listview.dart';

class StudentQuizView extends StatelessWidget {
  const StudentQuizView({super.key});
  static String id = "quiz view";

  @override
  Widget build(BuildContext context) {
    QuizModel quizModel =
        ModalRoute.of(context)!.settings.arguments as QuizModel;
    return AppScaffold(
      title: "Questions",
      containerChild: Column(
        children: [
          SizedBox(
            height: 650,
            child: CustomQuestionCardListView(quizModel: quizModel),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await Api().submitAnswer(
                  url: '$kBaseUrl/user/submitQuizAnswers/${quizModel.id}',
                  body: {
                    'user_id': BlocProvider.of<StudentAuthCubit>(
                      context,
                    ).userModel.studentId,
                    'answers': BlocProvider.of<FetchMyQuizesCubit>(
                      context,
                    ).answerList,
                  },
                  token: null,
                );
                showSnackBar(context, "Submitted successfully");
              } catch (e) {
                showSnackBar(context, e.toString());
              }
              BlocProvider.of<FetchMyQuizesCubit>(context).answerList = [];
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
