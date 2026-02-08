import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/scubits/chat_cubit/schat_cubit.dart';

import 'package:coursecraft/scubits/comment_cubit/fetch_comment_cubit.dart';
import 'package:coursecraft/scubits/student_auth_cubit/student_auth_cubit.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/sservices/get_certificate_sevice.dart';
import 'package:coursecraft/views/chat_view.dart';
import 'package:coursecraft/widgets/app_scaffold.dart';
import 'package:coursecraft/widgets/student/comment_modal_sheet.dart';
import 'package:coursecraft/widgets/student/comment_item.dart';
import 'package:coursecraft/widgets/student/rateing_modal_sheet.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentCousreRegisterInfoView extends StatelessWidget {
  const StudentCousreRegisterInfoView({super.key});
  static String id = "course register intfo";

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
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () async {
                  try {
                    dynamic data = await GetCertificateService()
                        .getCertificatePath(
                          userId: BlocProvider.of<StudentAuthCubit>(
                            context,
                          ).userModel.studentId.toString(),
                          courseId: courseModel.courseId.toString(),
                          myContext: context,
                        );
                    final url = data;
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    }
                  } on Exception catch (e) {
                    showSnackBar(context, e.toString());
                  }
                },
                icon: const Icon(FontAwesomeIcons.file, size: 30),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: CommentModalSheet(courseModel: courseModel),
                      );
                    },
                  );
                },
                icon: const Icon(
                  FontAwesomeIcons.comment,
                  size: 30,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<SChatCubit>(
                    context,
                  ).getMessages(courseModel: courseModel);
                  Navigator.pushNamed(
                    context,
                    StudentGroupView.id,
                    arguments: courseModel,
                  );
                },
                icon: const Icon(
                  FontAwesomeIcons.userGroup,
                  size: 30,
                  color: kPrimaryColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: RateingModalSheet(courseModel: courseModel),
                      );
                    },
                  );
                },
                icon: const Icon(
                  FontAwesomeIcons.star,
                  size: 30,
                  color: Colors.yellow,
                ),
              ),
            ],
          ), //
          const SizedBox(height: 10),
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
                    return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
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
        ],
      ),
    );
  }
}

// void _launchURL(String url) async {
//   if (await canLaunch(url)) {
//     await launch(
//       url,
//       forceSafariVC: true, // iOS
//       forceWebView: true, // Android
//       enableJavaScript: true,
//       headers: <String, String>{
//         'Content-Type': 'application/x-www-form-urlencoded'
//       },
//     );
//   } else {
//     throw 'Could not launch $url';
//   }
// }
