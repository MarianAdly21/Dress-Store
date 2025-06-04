part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}
class OpenCategoryScreenEvent extends HomeScreenEvent {}
class OPenProductScreenEvent extends HomeScreenEvent {}
class OpenSearchScreenEvent extends HomeScreenEvent {}
class AddToFavoriteEvent extends HomeScreenEvent {}
class OpenCartScreenEvent extends HomeScreenEvent {}
class OpenProfileScreenEvent extends HomeScreenEvent {}