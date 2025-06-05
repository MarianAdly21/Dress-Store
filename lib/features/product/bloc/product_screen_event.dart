part of 'product_screen_bloc.dart';

@immutable
sealed class ProductScreenEvent {}

class loadedProductEvent extends ProductScreenEvent {
  final int itemId;

  loadedProductEvent({required this.itemId});
}

class ChoiceColorEvent extends ProductScreenEvent {}

class ChoiceSizeEvent extends ProductScreenEvent {}

class AddToCartEvent extends ProductScreenEvent {}
