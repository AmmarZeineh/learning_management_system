import 'package:flutter/material.dart';
import 'package:coursecraft/smodels/video_model.dart';
import 'package:coursecraft/widgets/student/content_card.dart';

class ContentCardListView extends StatelessWidget {
  const ContentCardListView({super.key, required this.videos});
  final List<VideoModel> videos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videos.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ContentCard(index: index + 1, videoModel: videos[index]);
      },
    );
  }
}
