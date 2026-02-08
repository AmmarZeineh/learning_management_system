import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/scubits/fetch_course_cubit/fetch_course_cubit_cubit.dart';
import 'package:coursecraft/scubits/fetch_my_courses_cubit/fetch_my_courses_cubit.dart';
import 'package:coursecraft/scubits/student_auth_cubit/student_auth_cubit.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/smodels/user_model.dart';
import 'package:coursecraft/views/student_all_courses_view.dart';
import 'package:coursecraft/views/student_card_view.dart';
import 'package:coursecraft/views/student_mycorses_view.dart';
import 'package:coursecraft/widgets/student/my_courses_listview.dart';
import 'package:coursecraft/widgets/student/custom_container.dart';
import 'package:coursecraft/widgets/student/courses_list_view.dart';
import 'package:svg_flutter/svg.dart';

class StudentBodyHomeView extends StatefulWidget {
  const StudentBodyHomeView({super.key});
  static String id = "Student body";

  @override
  State<StudentBodyHomeView> createState() => _StudentBodyHomeViewState();
}

class _StudentBodyHomeViewState extends State<StudentBodyHomeView> {
  Future<void> _handleRefresh() async {
    await BlocProvider.of<FetchCourseCubitCubit>(context).getAvailableCourses(
      id: BlocProvider.of<StudentAuthCubit>(
        context,
      ).userModel.studentId.toString(),
    );
    BlocProvider.of<FetchMyCoursesCubit>(context).getMyCourses(
      id: BlocProvider.of<StudentAuthCubit>(
        context,
      ).userModel.studentId.toString(),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = BlocProvider.of<StudentAuthCubit>(context).userModel;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, StudentCardView.id);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 25,
              ),
            ),
            const SizedBox(width: 10),
          ],
          automaticallyImplyLeading: false,
          backgroundColor: kPrimaryColor,
          title: Text(
            "Hello , ${userModel.username} ",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: CustomContainer(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              SvgPicture.asset(
                'assets/images/online_learning.svg',
                height: 200,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All Courses :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, StudentAllCoursesView.id),
                    child: const Text(
                      ">>See All",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              FutureBuilder(
                future: BlocProvider.of<FetchCourseCubitCubit>(
                  context,
                ).getAvailableCourses(id: userModel.studentId.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<CourseModel> courses = snapshot.data!;

                    return CoursesListView(courses: courses);
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              const SizedBox(height: 30),
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
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              FutureBuilder(
                future: BlocProvider.of<FetchMyCoursesCubit>(
                  context,
                ).getMyCourses(id: userModel.studentId.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<CourseModel> myCourses = snapshot.data!;

                    return MyCoursesListview(courses: myCourses);
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
