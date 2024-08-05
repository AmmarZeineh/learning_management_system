import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learning_management_system/constants.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_management_system/cubits/fetch_quizzes_cubit/fetch_quizzes_cubit.dart';
import 'package:learning_management_system/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:learning_management_system/models/course_model.dart';
import 'package:learning_management_system/views/instructor_home_view_body.dart';
import 'package:learning_management_system/views/instructor_profile_view.dart';
import 'package:learning_management_system/views/instructor_quizezzes_view.dart';

class InstructorHomeView extends StatefulWidget {
  const InstructorHomeView({super.key});
  static String id = "InstructorHome";

  @override
  State<InstructorHomeView> createState() => _InstructorHomeViewState();
}

class _InstructorHomeViewState extends State<InstructorHomeView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<CourseModel> coursesList =
        ModalRoute.of(context)!.settings.arguments as List<CourseModel>;
    List<Widget> listOption = <Widget>[
      InstructorHomeViewBody(
        coursesList: coursesList,
      ),
      const InstructorQuizzesView(),
      const InstructorProfileView(),
    ];
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            backgroundColor: Colors.white,
            gap: 12,
            activeColor: Colors.white,
            tabBackgroundColor: kPrimaryColor,
            padding: const EdgeInsets.all(16),
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            tabs: [
              const GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.quiz,
                text: "Quizez",
                onPressed: () async {
                  BlocProvider.of<FetchQuizzesCubit>(context).getAllQuizzes(
                      id: BlocProvider.of<TeacherAuthCubit>(context)
                          .teacherModel!
                          .teacherId!);
                },
              ),
              const GButton(
                icon: FontAwesomeIcons.person,
                text: "Profile",
              )
            ],
          ),
        ),
      ),
      body: listOption.elementAt(_currentIndex),
    );
  }
}
