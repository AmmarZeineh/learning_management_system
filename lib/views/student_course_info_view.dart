import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/scubits/comment_cubit/fetch_comment_cubit.dart';
import 'package:coursecraft/scubits/fetch_course_cubit/fetch_course_cubit_cubit.dart';
import 'package:coursecraft/scubits/student_auth_cubit/student_auth_cubit.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/sservices/buy_course.dart';
import 'package:coursecraft/widgets/app_scaffold.dart';
import 'package:coursecraft/widgets/custom_button.dart';
import 'package:coursecraft/widgets/student/comment_item.dart';
import 'package:coursecraft/widgets/student/rating_widget.dart';
import 'package:svg_flutter/svg.dart';

class StudentCourseInfoView extends StatelessWidget {
  const StudentCourseInfoView({super.key});
  static String id = "Student Course info";

  @override
  Widget build(BuildContext context) {
    CourseModel courseModel =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    BlocProvider.of<FetchCommentCubit>(
      context,
    ).getComment(id: courseModel.courseId.toString());

    return AppScaffold(
      title: courseModel.courseName,
      containerChild: Column(
        children: [
          SvgPicture.asset("assets/images/instructor.svg", height: 300),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Course Description :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 350,
                height: 70,
                child: Text(
                  maxLines: 10,
                  courseModel.courseDes,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(.45),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Course rate :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              RatingWidget(courseModel: courseModel),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Course Price :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                r'$'
                "${courseModel.price.toString()}",
                style: const TextStyle(fontSize: 20, color: Colors.green),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Comments :',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 10),
              BlocBuilder<FetchCommentCubit, FetchCommentState>(
                builder: (context, state) {
                  if (state is FetchCommentLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FetchCommentFailure) {
                    return Center(child: Text(state.errMessage));
                  }
                  if (BlocProvider.of<FetchCommentCubit>(
                    context,
                  ).comments.isNotEmpty) {
                    return SizedBox(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.zero,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 70,
                            child: CommentItem(
                              userName: BlocProvider.of<FetchCommentCubit>(
                                context,
                              ).comments[index].studentCourse!.user!.username!,
                              value: BlocProvider.of<FetchCommentCubit>(
                                context,
                              ).comments[index].value!,
                              date: BlocProvider.of<FetchCommentCubit>(
                                context,
                              ).comments[index].createdAt!,
                            ),
                          );
                        },
                        itemCount: BlocProvider.of<FetchCommentCubit>(
                          context,
                        ).comments.length,
                      ),
                    );
                  } else {
                    return const Text(
                      'No Comments Yet',
                      style: TextStyle(fontSize: 18),
                    );
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                ),
                margin: const EdgeInsets.only(right: 10),
                height: 40,
                width: 45,
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    BlocProvider.of<FetchCourseCubitCubit>(
                      context,
                    ).cardCourses.add(courseModel);
                    showSnackBar(context, "Added Successfully");
                  },
                ),
              ),
              CustomButton(
                title: "buy now",
                textColor: Colors.white,
                buttonColor: kPrimaryColor,
                onTap: () async {
                  try {
                    await BuyCourse().buyCourse(
                      userId: BlocProvider.of<StudentAuthCubit>(
                        context,
                      ).userModel.studentId.toString(),
                      couresId: courseModel.courseId.toString(),
                    );
                    BlocProvider.of<FetchCourseCubitCubit>(
                      context,
                    ).cardCourses.remove(courseModel);
                    showSnackBar(context, "Course purchased successfully");
                    Navigator.pop(context);
                  } on Exception catch (e) {
                    showSnackBar(context, e.toString());
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//