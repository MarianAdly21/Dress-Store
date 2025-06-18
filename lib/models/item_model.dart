import 'package:dress_store/models/color_model.dart';
import 'package:dress_store/models/size_model.dart';

class ItemModel {
  bool isFavorite;
  final String image;
  final String name;
  double price;
  final String description;
  final List<SizeModel> sizes;
  final List<ColorModel> colors;
  final int id;
  final int categoryId;

  ItemModel( { 
    this.isFavorite = false,
    required this.categoryId,
    required this.id,
    required this.image,
    required this.colors,
    required this.description,
    required this.sizes,
    required this.name,
    required this.price,
  });
}
