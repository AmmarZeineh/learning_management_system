import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/cubits/cubit/fetcht_teacher_videos_cubit.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/models/course_model.dart';
import 'package:coursecraft/widgets/app_scaffold.dart';

class InstructorViewFilesView extends StatelessWidget {
  const InstructorViewFilesView({super.key});

  static String id = 'InstructorViewFilesView';

  @override
  Widget build(BuildContext context) {
    CourseModel courseModel =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    return AppScaffold(
      title: 'Course Files',
      containerChild:
          BlocBuilder<FetchtTeacherVideosCubit, FetchtTeacherVideosState>(
            builder: (context, state) {
              if (state is FetchtTeacherVideosLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FetchtTeacherVideosFailure) {
                return Center(child: Text(state.err));
              }
              return Column(
                children: [
                  const SizedBox(width: double.infinity),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return FileContainer(
                        courseModel: courseModel,
                        id: BlocProvider.of<FetchtTeacherVideosCubit>(
                          context,
                        ).videos[index].id,
                      );
                    },
                    itemCount: BlocProvider.of<FetchtTeacherVideosCubit>(
                      context,
                    ).videos.length,
                    shrinkWrap: true,
                    primary: false,
                  ),
                ],
              );
            },
          ),
    );
  }
}

class FileContainer extends StatelessWidget {
  const FileContainer({super.key, required this.id, required this.courseModel});
  final int id;
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: const Icon(Icons.video_file),
          title: const Text('File Number 1'),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Alert'),
                    content: const Text('Delete the File?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () async {
                          try {
                            await Api().put(
                              url: '${baseUrl}teacher/deleteFile/$id',
                              body: null,
                              token: null,
                            );
                            BlocProvider.of<FetchtTeacherVideosCubit>(
                              context,
                            ).getVideos(id: courseModel.courseId.toString());
                            showSnackBar(context, 'File Deleted Successfully');
                            Navigator.pop(context);
                          } on Exception catch (e) {
                            showSnackBar(context, e.toString());
                          }
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
