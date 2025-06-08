part of 'cart_screen_bloc.dart';

@immutable
sealed class CartScreenEvent {}

class LoadedItemsToCartEvent extends CartScreenEvent {}

class DeleteItemEvent extends CartScreenEvent {
  final int itemId;

  DeleteItemEvent({required this.itemId});
}

class IncreaseOrDecreaseItemEvent extends CartScreenEvent {}

class PayEvent extends CartScreenEvent {}
