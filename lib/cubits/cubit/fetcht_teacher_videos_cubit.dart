import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/smodels/video_model.dart';

part 'fetcht_teacher_videos_state.dart';

class FetchtTeacherVideosCubit extends Cubit<FetchtTeacherVideosState> {
  FetchtTeacherVideosCubit() : super(FetchtTeacherVideosInitial());

  late List<VideoModel> videos;

  Future<List<VideoModel>> getVideos({required String id}) async {
    videos = [];
    emit(FetchtTeacherVideosLoading());
    try {
      dynamic data = await Api().put(
        url: "${baseUrl}user/showFiles/$id",
        body: null,
        token: null,
      );

      for (
        var i = 0;
        i < data["This is all the files uploaded for the course"].length;
        i++
      ) {
        videos.add(
          VideoModel.fromJson(
            data["This is all the files uploaded for the course"][i],
          ),
        );
      }
      emit(FetchtTeacherVideosSuccess());
    } on Exception catch (e) {
      emit(FetchtTeacherVideosFailure(err: e.toString()));
    }
    return videos;
  }
}
