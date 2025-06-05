part of 'product_screen_bloc.dart';

@immutable
sealed class ProductScreenEvent {}

class LoadedProductEvent extends ProductScreenEvent {
  final int itemId;

  LoadedProductEvent({required this.itemId});
}

class ChoiceColorEvent extends ProductScreenEvent {}

class ChoiceSizeEvent extends ProductScreenEvent {}

class AddToCartEvent extends ProductScreenEvent {}
