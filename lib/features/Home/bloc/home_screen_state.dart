part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

class LoadedHomeScreenDataSuccessfullyState extends HomeScreenState {
  final List<ItemModel> items;

  LoadedHomeScreenDataSuccessfullyState({required this.items});
}

class OpenCategoryScreenState extends HomeScreenState {
  final int categoryId;

  OpenCategoryScreenState({required this.categoryId});
}

class LoadingState extends HomeScreenState {}

class ErrorState extends HomeScreenState {}

class OpenProductScreenState extends HomeScreenState {
  final int itemId;

  OpenProductScreenState({required this.itemId});
}

class OpenSearchScreenState extends HomeScreenState {}

class OpenCartScreenState extends HomeScreenState {
  final List<AddToCartSendModel> items;

  OpenCartScreenState({required this.items});
}

class OpenProfileScreenState extends HomeScreenState {}

class ConvertItemToFavoriteState extends HomeScreenState {
  final bool isFavorte;

  ConvertItemToFavoriteState({required this.isFavorte});
}
