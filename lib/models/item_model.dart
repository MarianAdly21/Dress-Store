import 'package:dress_store/models/color_model.dart';
import 'package:dress_store/models/size_model.dart';

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




