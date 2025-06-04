import 'package:flutter/widgets.dart';

class ItemModel {
   bool isFavorite;
  final String image;
  final String name;
  final double price;
  final String description;
  final List<String> sizes;
  final List<Color> colors;

   ItemModel({
    this.isFavorite =false,
    required this.image,
    required this.colors,
    required this.description,
    required this.sizes,
    required this.name,
    required this.price,
  });
}
