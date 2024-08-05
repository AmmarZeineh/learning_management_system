import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
// For basename
import 'package:learning_management_system/constants.dart';

part 'upload_files_and_videos_state.dart';

class UploadFilesAndVideosCubit extends Cubit<UploadFilesAndVideosState> {
  UploadFilesAndVideosCubit() : super(UploadFilesAndVideosInitial());

  List<File?> videos = [];

  List<String?> videoPaths = [];

  List<File?> pdfs = [];

  List<String?> pdfPaths = [];

  givePaths() {
    if (videos.isNotEmpty) {
      for (var i = 0; i < videos.length; i++) {
        videoPaths.add(videos[i]!.path);
      }
    }
    if (pdfs.isNotEmpty) {
      for (var i = 0; i < pdfs.length; i++) {
        pdfPaths.add(pdfs[i]!.path);
      }
    }
  }

  uploadFilesToCourse(
      {required List<String?> videosPaths,
      required List<String?> pdfsPaths,
      required String courseId}) async {
    emit(UploadFilesAndVideosLoading());
    const url = '${baseUrl}teacher/addFilesToCourse';

    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['course_id'] = courseId;

    for (var v = 0; v < videosPaths.length; v++) {
      final videoFile =
          await http.MultipartFile.fromPath('videos[]', videosPaths[v]!);
      request.files.add(videoFile);
    }

    for (var v = 0; v < pdfsPaths.length; v++) {
      final pdfFile =
          await http.MultipartFile.fromPath('pdfs[]', pdfsPaths[v]!);
      request.files.add(pdfFile);
    }

    final response = await request.send();
    if (response.statusCode == 200) {
      emit(UploadFilesAndVideosSuccess());
    } else {
      final responseBody = await response.stream.bytesToString();
      emit(UploadFilesAndVideosFailure(errM: responseBody));
    }

    videoPaths.clear();
    videos.clear();
    pdfs.clear();
    pdfPaths.clear();
  }
}
