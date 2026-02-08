import 'package:bloc/bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/api.dart';
import 'package:coursecraft/smodels/video_model.dart';
import 'package:meta/meta.dart';

part 'fetch_videos_state.dart';

class FetchVideosCubit extends Cubit<FetchVideosState> {
  FetchVideosCubit() : super(FetchVidoesInitial());
  late List<VideoModel> videos;

  Future<List<VideoModel>> getVideos({required String id}) async {
    videos = [];
    emit(FetchVidoesLoading());
    dynamic data = await Api().put(
      url: "$kBaseUrl/user/showFiles/$id",
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
    emit(FetchVideosSuccess());
    return videos;
  }
}
