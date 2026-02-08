import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/cubits/fetch_quizzes_cubit/fetch_quizzes_cubit.dart';
import 'package:coursecraft/widgets/insturactor/quizzes_list_view_builder.dart';

class InstructorQuizzesView extends StatefulWidget {
  const InstructorQuizzesView({super.key});

  static String id = 'InstructorQuizzesView';

  @override
  State<InstructorQuizzesView> createState() => _InstructorQuizzesViewState();
}

class _InstructorQuizzesViewState extends State<InstructorQuizzesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.only(left: 32, right: 20),
            child: Text(
              'Quizzes',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Text(
                          'My Quizzes :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      BlocBuilder<FetchQuizzesCubit, FetchQuizzesState>(
                        builder: (context, state) {
                          if (state is FetchQuizzesLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is FetchQuizzesFailure) {
                            return Center(child: Text(state.err));
                          }
                          return QuizzesListViewBuilder(
                            quizzesList: BlocProvider.of<FetchQuizzesCubit>(
                              context,
                            ).quizzesList,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
