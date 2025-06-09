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

class ChoiceColorState extends ProductScreenState {
  final int colorId;

  ChoiceColorState({required this.colorId});
}

class ChoiceSizeState extends ProductScreenState {
  final int sizeId;

  ChoiceSizeState({required this.sizeId});
}

class AddToCartState extends ProductScreenState {
  final bool isAddedItem;


  AddToCartState( { required this.isAddedItem});
}

class ConvetToFavoritetState extends ProductScreenState {
  final bool isFavorte;

  ConvetToFavoritetState({required this.isFavorte});
}
