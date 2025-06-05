import 'package:flutter/widgets.dart';

class ItemModel {
  bool isFavorite;

  final String image;
  final String name;
  final double price;
  final String description;
  final List<SizeModel> sizes;
  final List<ColorModel> colors;
  final int id;

  ItemModel({
    this.isFavorite = false,
    
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

class ColorModel {
  final Color color;
  final int id;

  ColorModel({required this.color, required this.id});

}

