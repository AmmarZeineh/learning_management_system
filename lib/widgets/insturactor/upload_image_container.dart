import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadContainer extends StatelessWidget {
  const ImageUploadContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ImagePicker imagePicker = ImagePicker();
        imagePicker.pickImage(source: ImageSource.gallery);
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
