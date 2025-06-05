part of 'product_screen_bloc.dart';

@immutable
sealed class ProductScreenEvent {}

class LoadedProductEvent extends ProductScreenEvent {
  final int itemId;

  LoadedProductEvent({required this.itemId});
}

class ChoiceColorEvent extends ProductScreenEvent {}

class ChoiceSizeEvent extends ProductScreenEvent {
  final int idItem;
  final int idSize;

  ChoiceSizeEvent( {required this.idItem, required this.idSize});
}

class AddToCartEvent extends ProductScreenEvent {}
