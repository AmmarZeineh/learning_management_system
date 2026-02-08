import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/scubits/fetch_course_cubit/fetch_course_cubit_cubit.dart';
import 'package:coursecraft/widgets/app_scaffold.dart';
import 'package:coursecraft/widgets/student/custom_course_card_listview.dart';

//
class StudentAllCoursesView extends StatelessWidget {
  const StudentAllCoursesView({super.key});
  static String id = "Student All courses";

  @override
  Widget build(BuildContext context) {
    List<CourseModel> courses = BlocProvider.of<FetchCourseCubitCubit>(
      context,
    ).courses;
    return AppScaffold(
      title: "My Courses",
      containerChild: SizedBox(
        height: 700,
        child: CustomCoursCardListView(courses: courses),
      ),
    );
  }
}
