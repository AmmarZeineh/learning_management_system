import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key, required this.title, required this.containerChild});

  final String title;
  final Widget? containerChild;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(child: containerChild),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
