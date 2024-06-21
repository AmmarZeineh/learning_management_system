import 'package:flutter/material.dart';
import 'package:learning_management_system/widgets/login_signup_scaffold.dart';
import 'package:svg_flutter/svg.dart';

class StudentMycorsesView extends StatelessWidget {
  const StudentMycorsesView({super.key});
  static String id = "StudentMycorses";

  @override
  Widget build(BuildContext context) {
    return const LoginSignUpScaffold(
        title: "My Courses",
        containerChild: Column(
          children: [
            SizedBox(height: 500, child: CustomCoursCardListView()),
          ],
        ));
  }
}

class CustomCourseCard extends StatelessWidget {
  const CustomCourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Card(
        elevation: 12,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/images/undraw_business_chat_re_gg4h.svg",
                width: 80,
                height: 80,
              ),
              Column(
                children: [
                  const Text(
                    "Flutter master",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "learn flutter form zero to hero",
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCoursCardListView extends StatelessWidget {
  const CustomCoursCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const CustomCourseCard();
      },
    );
    ;
  }
}
