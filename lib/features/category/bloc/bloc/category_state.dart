part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
class LoadingState extends CategoryState {}

class ErrorState extends CategoryState {}
class OpenProductScreenState extends CategoryState {
  final int itemId;

  OpenProductScreenState({required this.itemId});
}
class OpenProfileScreenState extends CategoryState{}
class ConvertItemToFavoriteState extends CategoryState {
  final bool isFavorte;

  ConvertItemToFavoriteState({required this.isFavorte});
}
