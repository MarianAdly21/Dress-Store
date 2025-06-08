part of 'cart_screen_bloc.dart';

@immutable
sealed class CartScreenEvent {}

class LoadedItemsToCartEvent extends CartScreenEvent {}

class DeleteItemEvent extends CartScreenEvent {
  final int itemId;

  DeleteItemEvent({required this.itemId});
}

class IncreaseItemEvent extends CartScreenEvent {
  final ItemModel item;

  IncreaseItemEvent({required this.item});
}

class DecreaseItemEvent extends CartScreenEvent {
  final ItemModel item;

  DecreaseItemEvent({required this.item});
}

class PayEvent extends CartScreenEvent {}
