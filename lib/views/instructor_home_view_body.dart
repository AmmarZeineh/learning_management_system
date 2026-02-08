import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/cubits/fetch_courses_cubit/fetch_courses_cubit_cubit.dart';
import 'package:coursecraft/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:coursecraft/models/course_model.dart';
import 'package:coursecraft/models/teacher_model.dart';
import 'package:coursecraft/widgets/insturactor/courses_grid_view_builder.dart';
import 'package:coursecraft/widgets/insturactor/custom_bottom_sheet_body.dart';

class InstructorHomeViewBody extends StatefulWidget {
  const InstructorHomeViewBody({super.key, this.coursesList = const []});

  static String id = 'InstructorHomeViewBody';

  @override
  State<InstructorHomeViewBody> createState() => _InstructorHomeViewBodyState();
  final List<CourseModel> coursesList;
}

class _InstructorHomeViewBodyState extends State<InstructorHomeViewBody> {
  @override
  Widget build(BuildContext context) {
    TeacherModel teacherModel =
        BlocProvider.of<TeacherAuthCubit>(context).teacherModel as TeacherModel;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 20),
            child: Row(
              children: [
                Text(
                  'Hello, ${teacherModel.username} ',
                  style: const TextStyle(color: Colors.white, fontSize: 28),
                ),
              ],
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
                          'My Courses :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height:
                            MediaQuery.sizeOf(context).height -
                            (MediaQuery.sizeOf(context).height -
                                MediaQuery.sizeOf(context).height * 0.665),
                        child:
                            BlocBuilder<
                              FetchCoursesCubit,
                              FetchCoursesCubitState
                            >(
                              builder: (context, state) {
                                if (state is FetchCoursesCubitSuccess) {
                                  return CoursesGridViewBuilder(
                                    coursesList:
                                        BlocProvider.of<FetchCoursesCubit>(
                                          context,
                                        ).coursesList,
                                  );
                                } else if (state is FetchCoursesCubitFailure) {
                                  return Center(child: Text(state.err));
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                minimumSize: const Size(150, 50),
                                backgroundColor: kPrimaryColor,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(
                                          context,
                                        ).viewInsets.bottom,
                                      ),
                                      child: const CustomBottomSheetBody(),
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                'Create a new course',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
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
