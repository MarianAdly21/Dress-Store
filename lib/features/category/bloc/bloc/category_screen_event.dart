part of 'category_screen_bloc.dart';

@immutable
sealed class CategoryScreenEvent {}

class LoadedCategoryScreenDataSuccessfullyEvent extends CategoryScreenEvent {
  final int id;

  LoadedCategoryScreenDataSuccessfullyEvent({required this.id});
}

class OPenProductScreenEvent extends CategoryScreenEvent {
  final int itemId;

  OPenProductScreenEvent({required this.itemId});
}

class AddToFavoriteEvent extends CategoryScreenEvent {
  final int index;
  final ItemModel item;

  AddToFavoriteEvent({required this.index, required this.item});
}

class OpenProfileScreenEvent extends CategoryScreenEvent {}
