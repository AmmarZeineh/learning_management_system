import 'package:flutter/material.dart';
import 'package:learning_management_system/models/category_model.dart';
import 'package:learning_management_system/widgets/student/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(
      categoryName: "Business",
      image: "assets/images/undraw_business_chat_re_gg4h.svg",
    ),
    CategoryModel(
      categoryName: "Technology",
      image: "assets/images/undraw_business_chat_re_gg4h.svg",
    ),
    CategoryModel(
      categoryName: "Health",
      image: "assets/images/undraw_business_chat_re_gg4h.svg",
    ),
    CategoryModel(
      categoryName: "Science",
      image: "assets/images/undraw_business_chat_re_gg4h.svg",
    ),
    CategoryModel(
      categoryName: "Fitness",
      image: "assets/images/undraw_business_chat_re_gg4h.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryCard(
            item: categories[index],
          );
        },
      ),
    );
  }
}
