import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:learning_management_system/models/teacher_model.dart';
import 'package:learning_management_system/widgets/insturactor/courses_grid_view_builder.dart';

class InstructorHomeViewBody extends StatefulWidget {
  const InstructorHomeViewBody({super.key});

  static String id = 'InstructorHomeViewBody';

  @override
  State<InstructorHomeViewBody> createState() => _InstructorHomeViewBodyState();
}

class _InstructorHomeViewBodyState extends State<InstructorHomeViewBody> {
  @override
  Widget build(BuildContext context) {
    TeacherModel teacherModel =
        BlocProvider.of<TeacherAuthCubit>(context).teacherModel as TeacherModel;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
           Padding(
            padding: EdgeInsets.only(left: 32, right: 20),
            child: Row(
              children: [
                Text(
                  'Hello, ${teacherModel.username} ',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ],
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
                        'Create a new course',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    const CoursesGridViewBuilder(),
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
