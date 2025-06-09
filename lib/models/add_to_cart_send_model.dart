import 'package:dress_store/models/item_model.dart';

class AddToCartSendModel {
  final ItemModel item;
  final int? sizeId;
  final int? colorId;
  int quantity;

  AddToCartSendModel({
    this.quantity = 1,
    required this.item,
    required this.sizeId,
    required this.colorId,
  });
}
