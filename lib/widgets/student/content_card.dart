import 'package:flutter/material.dart';
import 'package:coursecraft/smodels/video_model.dart';
import 'package:coursecraft/views/student_play_video_view.dart';
import 'package:svg_flutter/svg.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({super.key, required this.videoModel, required this.index});
  final VideoModel videoModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        StudentPlayVideoView.id,
        arguments: videoModel,
      ),
      child: SizedBox(
        height: 100,
        child: Card(
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/undraw_login_re_4vu2.svg",
                  width: 80,
                  height: 80,
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "video : $index ",
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
