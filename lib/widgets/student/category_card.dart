import 'package:flutter/material.dart';
import 'package:learning_management_system/constants.dart';
import 'package:learning_management_system/models/category_model.dart';
import 'package:svg_flutter/svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.item});
  final CategoryModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 15,
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 0,
                  offset: const Offset(5, 10))
            ],
          ),
          width: 140,
          child: Card(
            color: Colors.white,
            elevation: 18,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  item.image,
                  width: 70,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  item.categoryName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
