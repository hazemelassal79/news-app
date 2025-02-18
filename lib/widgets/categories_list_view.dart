import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({super.key});
  final List<CategoryModel> categories = [
    CategoryModel(image: "assets/business.avif", categoryName: "business"),
    CategoryModel(image: "assets/entertainment.avif", categoryName: "entertainment"),
    CategoryModel(image: "assets/general.avif", categoryName: "general"),
    CategoryModel(image: "assets/health.avif", categoryName: "health"),
    CategoryModel(image: "assets/science.avif", categoryName: "science"),
    CategoryModel(image: "assets/sports.avif", categoryName: "sports"),
    CategoryModel(image: "assets/technology.jpeg", categoryName: "technology"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categories[index],
          );
        },
      ),
    );
  }
}
