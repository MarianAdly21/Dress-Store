import 'package:flutter/widgets.dart';

class ItemModel {
  bool isFavorite;
  bool isSizeChoice;
  final String image;
  final String name;
  final double price;
  final String description;
  final List<SizeModel> sizes;
  final List<Color> colors;
  final int id;

  ItemModel({
    this.isFavorite = false,
    this.isSizeChoice = false,
    required this.id,
    required this.image,
    required this.colors,
    required this.description,
    required this.sizes,
    required this.name,
    required this.price,
  });
}

class SizeModel {
  final String size;
  final int id;

  SizeModel({required this.size, required this.id});
}
