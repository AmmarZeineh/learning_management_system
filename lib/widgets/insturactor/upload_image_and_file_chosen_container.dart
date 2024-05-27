import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/insturactor/upload_image_container.dart';

class UploadImageAndChosenFileContainer extends StatelessWidget {
  const UploadImageAndChosenFileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageUploadContainer(),
          Text(
            'No file chosen',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox()
        ],
      ),
    );
  }
}
