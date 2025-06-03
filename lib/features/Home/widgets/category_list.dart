import 'package:dress_store/features/Home/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(categoryName: "All"),
    CategoryModel(categoryName: "Mini Dresses"),
    CategoryModel(categoryName: "Midi Dresses"),
    CategoryModel(categoryName: "Maxi Dresses"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _categoryCustomWidget(
              categoryModel: categories[index],
            );
          }),
    );
  }
}

class _categoryCustomWidget extends StatelessWidget {
  const _categoryCustomWidget({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin:const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Color(0xffFD8186)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            categoryModel.categoryName,
            style:const TextStyle(fontSize: 16),
          ),
        )),
      ),
    );
  }
}
