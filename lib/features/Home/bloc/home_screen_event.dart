part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}

class OpenHomeScreenEvent extends HomeScreenEvent {}

class OpenCategoryScreenEvent extends HomeScreenEvent {
  final CategoryModel catecoryModel;

  OpenCategoryScreenEvent({required this.catecoryModel});

}

class OPenProductScreenEvent extends HomeScreenEvent {
  final int itemId;

  OPenProductScreenEvent({required this.itemId});
}

class OpenSearchScreenEvent extends HomeScreenEvent {}

class AddToFavoriteEvent extends HomeScreenEvent {
  final int index;
  final ItemModel item;

  AddToFavoriteEvent({required this.index, required this.item});
}

class OpenCartScreenEvent extends HomeScreenEvent {}

class OpenProfileScreenEvent extends HomeScreenEvent {}
