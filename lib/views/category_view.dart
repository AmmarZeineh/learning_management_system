import 'package:flutter/material.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/views/instructor_choose_view.dart';
import 'package:coursecraft/views/student_choose_view.dart';
import 'package:coursecraft/widgets/custom_button.dart';
import 'package:svg_flutter/svg.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 70, width: MediaQuery.sizeOf(context).width),
          const Text(
            'Choose if you are an',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 40),
          SvgPicture.asset('assets/images/instructor.svg', height: 150),
          const SizedBox(height: 40),
          CustomButton(
            textColor: kPrimaryColor,
            title: 'Instructor',
            buttonColor: Colors.white,
            onTap: () {
              Navigator.pushNamed(context, InstructorChooseView.id);
            },
          ),
          const SizedBox(height: 40),
          const Text('Or', style: TextStyle(color: Colors.white, fontSize: 24)),
          const SizedBox(height: 40),
          SvgPicture.asset('assets/images/student.svg', height: 150),
          const SizedBox(height: 40),
          CustomButton(
            onTap: () {
              Navigator.pushNamed(context, StudentChooseView.id);
            },
            textColor: kPrimaryColor,
            buttonColor: Colors.white,
            title: 'Student',
          ),
        ],
      ),
    );
  }
}
//