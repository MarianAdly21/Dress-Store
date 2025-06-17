part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}
  class OPenProductScreenEvent extends CategoryEvent {
  final int itemId;

  OPenProductScreenEvent({required this.itemId});
}
class AddToFavoriteEvent extends CategoryEvent {
  final int index;
  final ItemModel item;

  AddToFavoriteEvent({required this.index, required this.item});
}

class OpenProfileScreenEvent extends CategoryEvent {}
