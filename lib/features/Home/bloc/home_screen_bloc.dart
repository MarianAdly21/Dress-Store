import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dress_store/features/Home/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

List<ItemModel> items = [
  ItemModel(
    image: "assets/images/item1.webp",
    name: "Kendry Gdsxvx",
    price: 2.1333,
    description:
        "The dress strapless  Its elegant silhouette is enhanced by a large bow detail, adding a touch of .",
    sizes: ['XS', 'S', 'M', 'L'],
    colors: [
      Colors.black,
      Colors.white,
      Colors.orange,
    ],
  ),
  ItemModel(
    image: "assets/images/item2.webp",
    name: "Kendry Gdsxvx",
    price: 2.1333,
    description:
        "The dress strapless  Its elegant silhouette is enhanced by a large bow detail, adding a touch of .",
    sizes: ['XS', 'S', 'M', 'L'],
    colors: [
      Colors.black,
      Colors.white,
      Colors.orange,
    ],
  ),
  ItemModel(
    image: "assets/images/item3.webp",
    name: "Kendry Gdsxvx",
    price: 2.1333,
    description:
        "The dress strapless  Its elegant silhouette is enhanced by a large bow detail, adding a touch of .",
    sizes: ['XS', 'S', 'M', 'L'],
    colors: [
      Colors.black,
      Colors.white,
      Colors.orange,
    ],
  ),
  ItemModel(
    image: "assets/images/item4.webp",
    name: "Kendry Gdsxvx",
    price: 2.1333,
    description:
        "The dress strapless  Its elegant silhouette is enhanced by a large bow detail, adding a touch of .",
    sizes: ['XS', 'S', 'M', 'L'],
    colors: [
      Colors.black,
      Colors.white,
      Colors.orange,
    ],
  ),
  ItemModel(
    image: "assets/images/item5.webp",
    name: "Kendry Gdsxvx",
    price: 2.1333,
    description:
        "The dress strapless  Its elegant silhouette is enhanced by a large bow detail, adding a touch of .",
    sizes: ['XS', 'S', 'M', 'L'],
    colors: [
      Colors.black,
      Colors.white,
      Colors.orange,
    ],
  ),
  ItemModel(
    image: "assets/images/item1.webp",
    name: "Kendry Gdsxvx",
    price: 2.1333,
    description:
        "The dress strapless  Its elegant silhouette is enhanced by a large bow detail, adding a touch of .",
    sizes: ['XS', 'S', 'M', 'L'],
    colors: [
      Colors.black,
      Colors.white,
      Colors.orange,
    ],
  ),
];

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<OpenHomeScreenEvent>(_loadedHomeScreenData);
    on<AddToFavoriteEvent>(_convertItemToFavorite);
  }

  FutureOr<void> _convertItemToFavorite(
      AddToFavoriteEvent event, Emitter<HomeScreenState> emit) {
    log("Befor Update ${event.item.isFavorite}");
    log("Befor Update ${event.index}");

    event.item.isFavorite = !event.item.isFavorite;
    
    log("after Update ${event.item.isFavorite}");

    emit(ConvertItemToFavoriteState(isFavorte: event.item.isFavorite));
  }

  FutureOr<void> _loadedHomeScreenData(
      OpenHomeScreenEvent event, Emitter<HomeScreenState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(LoadedHomeScreenDataSuccessfullyState(items: items));
  }
}
