part of 'product_screen_bloc.dart';

@immutable
sealed class ProductScreenEvent {}

class LoadedProductEvent extends ProductScreenEvent {
  final int itemId;

  LoadedProductEvent({required this.itemId});
}

class ChoiceColorEvent extends ProductScreenEvent {
  final int idItem;
  final int idColor;

  ChoiceColorEvent({required this.idItem, required this.idColor});
}

class ChoiceSizeEvent extends ProductScreenEvent {
  final int idItem;
  final int idSize;

  ChoiceSizeEvent({required this.idItem, required this.idSize});
}

class AddToCartEvent extends ProductScreenEvent {}

class ConvertToFavoriteEvent extends ProductScreenEvent {
  final ItemModel itme;

  ConvertToFavoriteEvent({required this.itme});
}
