import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/cubits/bottom_sheet_cubit/bottom_sheet_cubit.dart';
import 'package:coursecraft/cubits/fetch_courses_cubit/fetch_courses_cubit_cubit.dart';
import 'package:coursecraft/cubits/upload_files_and_videos_cubit/upload_files_and_videos_cubit.dart';
import 'package:coursecraft/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/widgets/custum_text_field.dart';
import 'package:coursecraft/widgets/insturactor/upload_videos_and_files_container.dart';

class CustomBottomSheetBody extends StatefulWidget {
  const CustomBottomSheetBody({super.key});

  @override
  State<CustomBottomSheetBody> createState() => _CustomBottomSheetBodyState();
}

class _CustomBottomSheetBodyState extends State<CustomBottomSheetBody> {
  String? courseName;
  String? courseType;
  String? coursePrice;
  String? courseDescription;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetCubit, BottomSheetState>(
      builder: (context, state) {
        if (state is BottomSheetInitial) {
          return Form(
            key: formKey,
            child: Container(
              height: 370,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    'Create a New Course',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomTextField(
                      hintText: 'Course Name',
                      onChanged: (p0) => courseName = p0,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomTextField(
                      hintText: 'Course Description',
                      onChanged: (p0) => courseDescription = p0,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 175,
                          child: CustomTextField(
                            onChanged: (p0) => courseType = p0,
                            hintText: 'Course Type',
                            fillColor: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 175,
                          child: CustomTextField(
                            textInputType: TextInputType.number,
                            onChanged: (p0) => coursePrice = p0.toString(),
                            hintText: 'Course Price',
                            fillColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            Text(
                              'Note : ',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'All fields are required',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {});
                              try {
                                dynamic response = await Api().post(
                                  url: '${baseUrl}teacher/addCourse',
                                  body: {
                                    'course_name': courseName,
                                    'course_description': courseDescription,
                                    'course_type': courseType,
                                    'course_price': coursePrice,
                                    'teacher_id':
                                        BlocProvider.of<TeacherAuthCubit>(
                                          context,
                                        ).teacherModel!.teacherId.toString(),
                                  },
                                  token: null,
                                );

                                BlocProvider.of<BottomSheetCubit>(
                                  context,
                                ).courseId = response['course']['id'];
                                showSnackBar(
                                  context,
                                  'Questions Created Successfully',
                                );
                                BlocProvider.of<BottomSheetCubit>(
                                  context,
                                ).changeBottomSheetUi(index: 1);
                              } on Exception catch (e) {
                                showSnackBar(context, e.toString());
                              }
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return BlocBuilder<
            UploadFilesAndVideosCubit,
            UploadFilesAndVideosState
          >(
            builder: (context, state) {
              if (state is UploadFilesAndVideosLoading) {
                return Container(
                  color: kPrimaryColor,
                  height: 230,
                  child: const Center(child: CircularProgressIndicator()),
                );
              } else if (state is UploadFilesAndVideosFailure) {
                return Container(
                  color: kPrimaryColor,
                  height: 230,
                  child: Text(state.errM),
                );
              }
              return Form(
                key: formKey,
                child: Container(
                  height: 230,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      const Text(
                        'Add videos and files ',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: UploadVideosAndFilesContainer(),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                Text(
                                  'Note : ',
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'At least one file',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  setState(() {});
                                  try {
                                    await BlocProvider.of<
                                          UploadFilesAndVideosCubit
                                        >(context)
                                        .uploadFilesToCourse(
                                          videosPaths:
                                              BlocProvider.of<
                                                    UploadFilesAndVideosCubit
                                                  >(context)
                                                  .videoPaths,
                                          pdfsPaths:
                                              BlocProvider.of<
                                                    UploadFilesAndVideosCubit
                                                  >(context)
                                                  .pdfPaths,
                                          courseId:
                                              BlocProvider.of<BottomSheetCubit>(
                                                context,
                                              ).courseId.toString(),
                                        );

                                    BlocProvider.of<BottomSheetCubit>(
                                      context,
                                    ).changeBottomSheetUi(index: 0);
                                    Navigator.pop(context, [
                                      BlocProvider.of<FetchCoursesCubit>(
                                        context,
                                      ).getAllCourses(
                                        id: BlocProvider.of<TeacherAuthCubit>(
                                          context,
                                        ).teacherModel!.teacherId!,
                                      ),
                                    ]);

                                    showSnackBar(
                                      context,
                                      'Course Created Successfully',
                                    );
                                  } on Exception catch (e) {
                                    showSnackBar(context, e.toString());
                                  }
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
