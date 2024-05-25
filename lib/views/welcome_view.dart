import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/widgets/intro_views_body.dart';

List pages = [
  const FirstIntroView(),
  const SecondIntroView(),
  const ThirdIntroView()
];

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  final PageController pageController = PageController();
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (int page) {
              setState(() {
                activePage = page;
              });
            },
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),
          Positioned(
            bottom: 145,
            left: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: List.generate(pages.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor:
                              activePage == index ? Colors.amber : Colors.grey,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 90,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.animateToPage(activePage + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: activePage == 2
                          ? const Text(
                              'Get Started',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            )
                          : const Text(
                              'Continue',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FirstIntroView extends StatelessWidget {
  const FirstIntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: IntroViewsBody(
      image: 'assets/images/online_teaching.svg',
      title: 'Teach From Anywhere',
      text1: 'Get intouch easily with your students',
      text2: 'From any where you want',
    ));
  }
}

class SecondIntroView extends StatelessWidget {
  const SecondIntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: IntroViewsBody(
      image: 'assets/images/online_learning.svg',
      text1: 'Get intouch easily with your instructors',
      text2: 'From any where you want',
      title: 'Learn From Anywhere',
    ));
  }
}

class ThirdIntroView extends StatelessWidget {
  const ThirdIntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: IntroViewsBody(
      image: 'assets/images/quiz.svg',
      text1: 'Take Quizzes easily From your instructors',
      text2: 'Anytime they add a quizz',
      title: 'Take Quizzes From Anywhere',
    ));
  }
}
