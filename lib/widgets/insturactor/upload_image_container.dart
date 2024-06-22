import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management_system/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:learning_management_system/helper/show_snack_bar.dart';

class ImageUploadContainer extends StatelessWidget {
  const ImageUploadContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          File file = File(result.files.single.path!);
          BlocProvider.of<TeacherAuthCubit>(context).photoLicensePath =
              file.path;
        } else {
          showSnackBar(context, 'You must choose an image');
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff2467b0),
            borderRadius: BorderRadius.circular(10)),
        height: 45,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.image,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Upload image',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//