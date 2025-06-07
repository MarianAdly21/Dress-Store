part of 'product_screen_bloc.dart';

@immutable
sealed class ProductScreenEvent {}

class LoadedProductEvent extends ProductScreenEvent {
  final int itemId;

  LoadedProductEvent({required this.itemId});
}

class ChoiceColorEvent extends ProductScreenEvent {
  final int colorId;

  ChoiceColorEvent({required this.colorId});
}

class ChoiceSizeEvent extends ProductScreenEvent {
  final int sizeId;

  ChoiceSizeEvent({required this.sizeId});
}

class AddToCartEvent extends ProductScreenEvent {
  final AddToCartSendModel addToCartSendModel;
  AddToCartEvent({required this.addToCartSendModel});
}

class ConvertToFavoriteEvent extends ProductScreenEvent {
  final ItemModel itme;

  ConvertToFavoriteEvent({required this.itme});
}
