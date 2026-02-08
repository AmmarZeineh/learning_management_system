import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/scubits/chat_cubit/schat_cubit.dart';
import 'package:coursecraft/scubits/student_auth_cubit/student_auth_cubit.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/widgets/insturactor/chat_bubble.dart';

class StudentGroupView extends StatefulWidget {
  const StudentGroupView({super.key});
  static String id = 'StudentGroupView';

  @override
  State<StudentGroupView> createState() => _StudentGroupViewState();
}

class _StudentGroupViewState extends State<StudentGroupView> {
  TextEditingController controller = TextEditingController();

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    CourseModel courseModel =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    String email = BlocProvider.of<StudentAuthCubit>(context).email!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Course Group',
          style: TextStyle(color: Colors.white),
        ),
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<SChatCubit, SChatState>(
              builder: (context, state) {
                return SizedBox(
                  height: 665,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    reverse: true,
                    controller: _controller,
                    itemCount: BlocProvider.of<SChatCubit>(
                      context,
                    ).allMessagesList.length,
                    itemBuilder: (context, index) {
                      return BlocProvider.of<SChatCubit>(
                                context,
                              ).allMessagesList[index].email ==
                              email
                          ? ChatBubbleOne(
                              message: BlocProvider.of<SChatCubit>(
                                context,
                              ).allMessagesList[index],
                            )
                          : ChatBubbleTwo(
                              message: BlocProvider.of<SChatCubit>(
                                context,
                              ).allMessagesList[index],
                            );
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                onSubmitted: (message) {
                  BlocProvider.of<SChatCubit>(context).sendMessages(
                    message: message,
                    email: email,
                    courseModel: courseModel,
                  );
                  controller.clear();

                  _controller.animateTo(
                    0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                  );
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  suffixIcon: Icon(Icons.send, color: kPrimaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
