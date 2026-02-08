import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/scubits/fetch_course_cubit/fetch_course_cubit_cubit.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/widgets/app_scaffold.dart';
import 'package:coursecraft/widgets/student/cutom_search_card.dart';

class StudentCardView extends StatelessWidget {
  const StudentCardView({super.key});
  static String id = "Student card";
  //
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: "Cart",
      containerChild: CustomCardListView(),
    );
  }
}

class CustomCardListView extends StatelessWidget {
  const CustomCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CourseModel> cardCourses = BlocProvider.of<FetchCourseCubitCubit>(
      context,
    ).cardCourses;
    return ListView.builder(
      itemCount: cardCourses.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CustomSearchCard(courseModel: cardCourses[index]);
      },
    );
  }
}
