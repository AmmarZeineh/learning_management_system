import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/cubits/teacher_auth_cubit/teacher_auth_cubit.dart';
import 'package:learning_management_system/helper/api.dart';
import 'package:learning_management_system/helper/show_snack_bar.dart';
import 'package:learning_management_system/views/welcome_view.dart';
import 'package:learning_management_system/widgets/custom_button.dart';
import 'package:learning_management_system/widgets/student/custom_container.dart';
import 'package:learning_management_system/widgets/student/custom_profile_container.dart';
import 'package:svg_flutter/svg.dart';

class InstructorProfileView extends StatelessWidget {
  const InstructorProfileView({super.key});
  static String id = "InstructorProfile";

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
              "Ammar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 8,
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
            const SizedBox(
              height: 20,
            ),
            const CustomProfileContainer(
              text: "Settings",
              icon: Icons.settings,
            ),
            const CustomProfileContainer(
              text: "About us",
              icon: FontAwesomeIcons.question,
            ),
            const CustomProfileContainer(
              text: "FAQ",
              icon: Icons.question_answer,
            ),
            const SizedBox(
              height: 75,
            ),
            CustomButton(
                onTap: () async {
                  try {
                    await BlocProvider.of<TeacherAuthCubit>(context)
                        .teacherLogout(
                            token: BlocProvider.of<TeacherAuthCubit>(context)
                                .teacherModel!
                                .token!);
                    showSnackBar(context, 'Logged out successfully');
                    Navigator.pushReplacementNamed(context, WelcomeView.id);
                  } on Exception catch (e) {
                    showSnackBar(context, e.toString());
                  }
                },
                title: 'Log out',
                textColor: Colors.white,
                buttonColor: kPrimaryColor)
          ],
        ),
      ),
    );
  }
}
