import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/helper/show_snack_bar.dart';
import 'package:coursecraft/scubits/student_auth_cubit/student_auth_cubit.dart';
import 'package:coursecraft/smodels/user_model.dart';
import 'package:coursecraft/sservices/get_balance_service.dart';
import 'package:coursecraft/views/student_login_view.dart';
import 'package:coursecraft/widgets/custom_button.dart';
import 'package:coursecraft/widgets/student/custom_container.dart';
import 'package:coursecraft/widgets/student/custom_profile_container.dart';
import 'package:svg_flutter/svg.dart';

class StudentProfileView extends StatelessWidget {
  const StudentProfileView({super.key});
  static String id = "StudentProfile";

  @override
  Widget build(BuildContext context) {
    UserModel userModel = BlocProvider.of<StudentAuthCubit>(context).userModel;
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
            const SizedBox(height: 24),
            CircleAvatar(
              radius: 60,
              child: SvgPicture.asset(
                "assets/images/undraw_pic_profile_re_7g2h.svg",
              ),
            ),
            const SizedBox(height: 8),
            Text(
              userModel.username,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              BlocProvider.of<StudentAuthCubit>(context).email!,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(height: 50),
            FutureBuilder(
              future: GetBalanceService().getMoney(
                id: userModel.studentId.toString(),
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomProfileContainer(
                    text: "Balance :  \$${snapshot.data}",
                    icon: Icons.wallet,
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            const CustomProfileContainer(
              text: "About us",
              icon: FontAwesomeIcons.question,
            ),
            CustomButton(
              title: "Log out",
              textColor: Colors.white,
              buttonColor: kPrimaryColor,
              onTap: () async {
                try {
                  await BlocProvider.of<StudentAuthCubit>(
                    context,
                  ).studentLogout(
                    token: BlocProvider.of<StudentAuthCubit>(
                      context,
                    ).userModel.token,
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    StudentLoginView.id,
                    (Route<dynamic> route) => false,
                  );
                } on Exception catch (e) {
                  showSnackBar(context, e.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
