part of 'product_screen_bloc.dart';

@immutable
sealed class ProductScreenState {}

final class ProductScreenInitial extends ProductScreenState {}

class LoadedProductSuccessfullyState extends ProductScreenState {
 final ItemModel itemModel;

  LoadedProductSuccessfullyState({required this.itemModel});
}
class ChoiceColorState extends ProductScreenState {}

class ChoiceSizeState extends ProductScreenState {}

class AddToCartState extends ProductScreenState {}

