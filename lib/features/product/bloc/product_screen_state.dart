part of 'product_screen_bloc.dart';

@immutable
sealed class ProductScreenState {}

final class ProductScreenInitial extends ProductScreenState {}

class LoadingState extends ProductScreenState {}

class ErrorState extends ProductScreenState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}

class LoadedProductSuccessfullyState extends ProductScreenState {
  final ItemModel itemModel;

  LoadedProductSuccessfullyState({required this.itemModel});
}

class ChoiceColorState extends ProductScreenState {}

class ChoiceSizeState extends ProductScreenState {}

class AddToCartState extends ProductScreenState {}
