import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/main.dart';
import 'package:learning_management_system/views/student_search_view.dart';
import 'package:learning_management_system/widgets/student/category_list_view.dart';
import 'package:learning_management_system/widgets/student/courses_list_view.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:learning_management_system/widgets/student/custom_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_management_system/widgets/student/quizes_list_view.dart';
import 'package:iconly/iconly.dart';

class StudentHomeView extends StatefulWidget {
  const StudentHomeView({super.key});
  static String id = " StudentHome";

  @override
  State<StudentHomeView> createState() => _StudentHomeViewState();
}

class _StudentHomeViewState extends State<StudentHomeView> {
  var _selectedTab = SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.bell,
                color: Colors.white,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, StudentSearchView.id);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 25,
              ),
            )
          ],
          automaticallyImplyLeading: false,
          backgroundColor: kPrimaryColor,
          title: const Text(
            "Hello , M.KK",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      body: CustomContainer(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Text(
                  "Category :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CategoryListView(),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Quizes :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  ">>See All",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
            const QuizesListView(),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Courses :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  ">>See All",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
            const CoursesListView(),
            const SizedBox(
              height: 20,
            ),
            CrystalNavigationBar(
              currentIndex: SelectedTab.values.indexOf(_selectedTab),
              height: 10,
              // indicatorColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.black.withOpacity(0.1),
              onTap: _handleIndexChanged,
              items: [
                /// Home
                CrystalNavigationBarItem(
                  unselectedColor: Colors.grey,
                  icon: IconlyBold.home,
                  unselectedIcon: IconlyLight.home,
                  selectedColor: const Color(0xff7183BE),
                ),

                /// Favourite
                CrystalNavigationBarItem(
                  unselectedColor: Colors.grey,
                  icon: IconlyBold.heart,
                  unselectedIcon: IconlyLight.heart,
                  selectedColor: Colors.red,
                ),

                /// Add

                /// Search
                CrystalNavigationBarItem(
                    unselectedColor: Colors.grey,
                    icon: IconlyBold.search,
                    unselectedIcon: IconlyLight.search,
                    selectedColor: const Color(0xff7183BE)),

                /// Profile
                CrystalNavigationBarItem(
                  unselectedColor: Colors.grey,
                  icon: IconlyBold.user_2,
                  unselectedIcon: IconlyLight.user,
                  selectedColor: const Color(0xff7183BE),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
