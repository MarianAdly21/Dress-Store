part of 'cart_screen_bloc.dart';

@immutable
sealed class CartScreenState {}

final class CartScreenInitial extends CartScreenState {}

class LoadingState extends CartScreenState {}

class LoadedItemsToCartState extends CartScreenState {
  final List<AddToCartSendModel> cartItems;

  LoadedItemsToCartState({required this.cartItems});
}

class ErrorState extends CartScreenState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}

class IncreaseItemState extends CartScreenState {}
class DecreaseItemState extends CartScreenState {}

class DeleteItemState extends CartScreenState {}

class PayState extends CartScreenState {}
