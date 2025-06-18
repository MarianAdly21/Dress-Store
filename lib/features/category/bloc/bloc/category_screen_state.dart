part of 'category_screen_bloc.dart';

@immutable
sealed class CategoryScreenState {}

final class CategoryInitial extends CategoryScreenState {}

class LoadingState extends CategoryScreenState {}

class ErrorState extends CategoryScreenState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}

class LoadedCategoryScreenDataSuccessfullyState extends CategoryScreenState {
  final List<ItemModel> items;

  LoadedCategoryScreenDataSuccessfullyState({required this.items});
}

class OpenProductScreenState extends CategoryScreenState {
  final int itemId;

  OpenProductScreenState({required this.itemId});
}

class OpenProfileScreenState extends CategoryScreenState {}

class ConvertItemToFavoriteState extends CategoryScreenState {
  final bool isFavorte;

  ConvertItemToFavoriteState({required this.isFavorte});
}
