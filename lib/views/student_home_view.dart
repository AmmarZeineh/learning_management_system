import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/student_profile_view.dart';
import 'package:learning_management_system/views/student_search_view.dart';
import 'package:learning_management_system/widgets/student/body_home_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentHomeView extends StatefulWidget {
  const StudentHomeView({super.key});
  static String id = " StudentHome";

  @override
  State<StudentHomeView> createState() => _StudentHomeViewState();
}

class _StudentHomeViewState extends State<StudentHomeView> {
  int _currentIndex = 0;
  List<Widget> listOption = <Widget>[
    const StudentBodyHomeView(),
    const StudentHomeView(),
    const StudentSearchView(),
    const StudentProfileView(),
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
                icon: Icons.favorite_border,
                text: "Likes",
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
              ),
              GButton(
                icon: FontAwesomeIcons.personHarassing,
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


