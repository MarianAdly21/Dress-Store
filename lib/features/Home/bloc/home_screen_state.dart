part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}
class OpenCategoryScreenState extends HomeScreenState {}
class OpenProductScreenState extends HomeScreenState {}
class OpenSearchScreenState extends HomeScreenState {}
class OpenCartScreenState extends HomeScreenState {}

class OpenProfileScreenState extends HomeScreenState {}

class ConvertToFavoriteState extends HomeScreenState {}