import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/student/custom_container.dart';
import 'package:learning_management_system/widgets/student/custom_profile_container.dart';
import 'package:svg_flutter/svg.dart';

class StudentProfileView extends StatelessWidget {
  const StudentProfileView({super.key});
  static String id = "StudentProfile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: CustomContainer(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            CircleAvatar(
              radius: 60,
              child: SvgPicture.asset(
                  "assets/images/undraw_pic_profile_re_7g2h.svg"),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Mhd khair",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "mhdkhairkh@gmail.com",
              style: TextStyle(color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: kPrimaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            const CustomProfileContainer(
              text: "Settings",
              icon: Icons.settings,
            ),
            const CustomProfileContainer(
              text: "Payments",
              icon: Icons.payments,
            ),
            const CustomProfileContainer(
              text: "About us",
              icon: FontAwesomeIcons.question,
            ),
            const CustomProfileContainer(
              text: "FAQ",
              icon: Icons.question_answer,
            ),
            const CustomButton(
                title: "Log out",
                textColor: Colors.white,
                buttonColor: kPrimaryColor)
          ],
        ),
      ),
    );
  }
}
