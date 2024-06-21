import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/widgets/student/custom_container.dart';

class StudentWalletView extends StatelessWidget {
  const StudentWalletView({super.key});
  static String id = "Student wallet";

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
            "Wallet",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: const CustomContainer(
        child: Center(
          child: Text("Wallet"),
        ),
      ),
    );
  }
}
