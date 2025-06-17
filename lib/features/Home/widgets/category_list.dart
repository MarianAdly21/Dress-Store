import 'package:dress_store/features/Home/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.onCatecoryTap});
  final List<CategoryModel> categories = const [
    CategoryModel(categoryName: "All", categoryId: 1),
    CategoryModel(categoryName: "Mini Dresses", categoryId: 2),
    CategoryModel(categoryName: "Midi Dresses", categoryId: 3),
    CategoryModel(categoryName: "Maxi Dresses", categoryId: 4),
  ];
  final void Function(int categoryId) onCatecoryTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _CategoryCustomWidget(
              onCatecoryTap: () => onCatecoryTap(categories[index].categoryId),
              categoryModel: categories[index],
            );
          }),
    );
  }
}

class _CategoryCustomWidget extends StatelessWidget {
  const _CategoryCustomWidget({
    super.key,
    required this.categoryModel,
    required this.onCatecoryTap,
  });
  final CategoryModel categoryModel;
  final void Function() onCatecoryTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCatecoryTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffFD8186)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            categoryModel.categoryName,
            style: TextStyle(
              color:
                  categoryModel.categoryId == 1 ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
      ),
    );
  }
}
