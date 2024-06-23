import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learning_management_system/constants.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  List<Widget> listOption = <Widget>[
    const InstructorHomeViewBody(),
    const InstructorQuizzesView(),
    const InstructorProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
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
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.quiz,
                text: "Quizez",
              ),
              GButton(
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
