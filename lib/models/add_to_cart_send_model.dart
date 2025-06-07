class AddToCartSendModel {
  final int productId;
  final int? sizeId;
  final int? colorId;
  final int numOfItem;

  AddToCartSendModel(
      {this.numOfItem = 1,
      required this.productId,
      required this.sizeId,
      required this.colorId});
}
