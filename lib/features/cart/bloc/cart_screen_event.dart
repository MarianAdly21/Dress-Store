part of 'cart_screen_bloc.dart';

@immutable
sealed class CartScreenEvent {}

class LoadedItemsToCartEvent extends CartScreenEvent {}

class DeleteItemEvent extends CartScreenEvent {}

class IncreaseOrDecreaseItemEvent extends CartScreenEvent {}

class PayEvent extends CartScreenEvent {}
