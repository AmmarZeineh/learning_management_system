import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/views/student_mycorses_view.dart';
import 'package:learning_management_system/views/student_myquizes_view.dart';
import 'package:learning_management_system/widgets/student/category_list_view.dart';
import 'package:learning_management_system/widgets/student/courses_list_view.dart';
import 'package:learning_management_system/widgets/student/custom_container.dart';
import 'package:learning_management_system/widgets/student/quizes_list_view.dart';

class StudentBodyHomeView extends StatelessWidget {
  const StudentBodyHomeView({
    super.key,
  });
  static String id = "Student body";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 10,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "My Courses :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, StudentMycorsesView.id),
                  child: const Text(
                    ">>See All",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
            const QuizesListView(),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "My Quizes :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, StudentMyQuizesView.id),
                  child: const Text(
                    ">>See All",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
            const CoursesListView(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
