import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/widgets/insturactor/quizzes_list_view_builder.dart';

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
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 32, right: 20),
            child: Text(
              'Quizzez',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
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
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(150, 50),
                          backgroundColor: kPrimaryColor),
                      onPressed: () {},
                      child: const Text(
                        'Create a new Quiz',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    const QuizzesListViewBuilder(),
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
