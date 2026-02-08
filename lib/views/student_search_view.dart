import 'package:flutter/material.dart';
import 'package:coursecraft/constants.dart';
import 'package:coursecraft/smodels/course_modal.dart';
import 'package:coursecraft/sservices/search_service.dart';
import 'package:coursecraft/widgets/app_scaffold.dart';
import 'package:coursecraft/widgets/student/custom_search_textfield.dart';
import 'package:coursecraft/widgets/student/search_card_listview.dart';

class StudentSearchView extends StatefulWidget {
  const StudentSearchView({super.key});
  static String id = "StudentSearch";

  @override
  State<StudentSearchView> createState() => _StudentSearchViewState();
}

class _StudentSearchViewState extends State<StudentSearchView> {
  late String term;

  late List<CourseModel> courses = [];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Search",
      containerChild: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 45,
                width: 295,
                child: CustomSearchTextField(
                  onChanged: (data) {
                    term = data;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: IconButton(
                  onPressed: () async {
                    courses = await SearchService().searchCourses(
                      term: term,
                      context: context,
                    );
                    setState(() {});
                  },
                  icon: const Icon(Icons.search, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(height: 350, child: SearchCardListview(courses: courses)),
        ],
      ),
    );
  }
}
//