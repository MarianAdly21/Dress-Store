import 'package:dress_store/models/item_model.dart';

class AddToCartSendModel {
  final ItemModel item;
  final int? sizeId;
  final int? colorId;
   int numOfItem;

  AddToCartSendModel({
    this.numOfItem = 1,
    required this.item,
    required this.sizeId,
    required this.colorId,
  });
}
