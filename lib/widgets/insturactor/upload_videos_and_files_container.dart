import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management_system/cubits/upload_files_and_videos_cubit/upload_files_and_videos_cubit.dart';

class UploadVideosAndFilesContainer extends StatelessWidget {
  const UploadVideosAndFilesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['mp4', 'pdf', 'mov', 'ogg', 'qt'],
            allowMultiple: true);
        if (result != null) {
          //  BlocProvider.of<FilesAndVideosCubit>(context).videos =
          List<File> res = result.paths.map((path) => File(path!)).toList();
          List<File> pdfs = [];
          List<File> videos = [];
          for (var i = 0; i < res.length; i++) {
            if (res[i].path.contains('pdf')) {
              pdfs.add(res[i]);
              res.remove(res[i]);
            }
          }
          videos = res;
          BlocProvider.of<UploadFilesAndVideosCubit>(context).videos = videos;
          BlocProvider.of<UploadFilesAndVideosCubit>(context).pdfs = pdfs;
          BlocProvider.of<UploadFilesAndVideosCubit>(context).givePaths();
        } else {
          // User canceled the picker
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
                  'Upload Videos and Files',
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
