import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dress_store/demo_data.dart';
import 'package:dress_store/features/Home/models/category_model.dart';
import 'package:dress_store/models/add_to_cart_send_model.dart';
import 'package:dress_store/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<OpenHomeScreenEvent>(_loadedHomeScreenData);
    on<AddToFavoriteEvent>(_convertItemToFavorite);
    on<OPenProductScreenEvent>(_openProductScreen);
    on<OpenCartScreenEvent>(_openCartScreen);
    on<OpenCategoryScreenEvent>(_openCategoryScreen);
  }

  FutureOr<void> _openCategoryScreen(
      OpenCategoryScreenEvent event, Emitter<HomeScreenState> emit) {
    emit(OpenCategoryScreenState(categoryModel: event.catecoryModel));
  }

  FutureOr<void> _openCartScreen(
      OpenCartScreenEvent event, Emitter<HomeScreenState> emit) {
    emit(OpenCartScreenState(items: DemoData.cartItems));
    log("push to cart screen succussfly");
  }

  FutureOr<void> _openProductScreen(
      OPenProductScreenEvent event, Emitter<HomeScreenState> emit) {
    emit(OpenProductScreenState(itemId: event.itemId));
    log("the item id is ${event.itemId}");
    log("open doneeeeeeee");
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
    emit(LoadedHomeScreenDataSuccessfullyState(items: DemoData.items));
  }
}
