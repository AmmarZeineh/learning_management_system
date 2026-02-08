import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:coursecraft/scubits/fetch_videos/fetch_videos_cubit.dart';
import 'package:coursecraft/widgets/app_scaffold.dart';
import 'package:coursecraft/widgets/student/content_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../smodels/video_model.dart';

//
class StudentPlayVideoView extends StatefulWidget {
  const StudentPlayVideoView({super.key});
  static String id = "play video";

  @override
  State<StudentPlayVideoView> createState() => _StudentPlayVideoViewState();
}

class _StudentPlayVideoViewState extends State<StudentPlayVideoView> {
  @override
  Widget build(BuildContext context) {
    VideoModel videoModel =
        ModalRoute.of(context)!.settings.arguments as VideoModel;
    return AppScaffold(
      title: "title",
      containerChild: Column(
        children: [
          SizedBox(
            height: 300,
            child: VideoPlayerPage(videoUrl: videoModel.url),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Text(
                "Course content : ",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 450,
            child: ContentCardListView(
              videos: BlocProvider.of<FetchVideosCubit>(context).videos,
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late CustomVideoPlayerController _customVideoPlayerController;
  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return CustomVideoPlayer(
      customVideoPlayerController: _customVideoPlayerController,
    );
  }

  void initializeVideoPlayer() {
    VideoPlayerController videoPlayerController;
    videoPlayerController =
        VideoPlayerController.networkUrl(
            Uri.parse('http://192.168.122.109:8000/storage/${widget.videoUrl}'),
          )
          ..initialize().then((onValue) {
            setState(() {});
          });
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }
}
