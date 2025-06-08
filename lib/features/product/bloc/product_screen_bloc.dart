import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dress_store/demo_data.dart';
import 'package:dress_store/models/add_to_cart_send_model.dart';
import 'package:dress_store/models/item_model.dart';
import 'package:meta/meta.dart';

part 'product_screen_event.dart';
part 'product_screen_state.dart';

bool isExisting = false;

class ProductScreenBloc extends Bloc<ProductScreenEvent, ProductScreenState> {
  ProductScreenBloc() : super(ProductScreenInitial()) {
    on<LoadedProductEvent>(_loadedproductData);
    on<ChoiceSizeEvent>(_choiceSize);
    on<ChoiceColorEvent>(_choiceColor);
    on<ConvertToFavoriteEvent>(_convertItemToFav);
    on<AddToCartEvent>(_addProductToCart);
  }

  FutureOr<void> _addProductToCart(
      AddToCartEvent event, Emitter<ProductScreenState> emit) {
    for (var item in DemoData.cartItems) {
      if (event.addToCartSendModel.colorId == item.colorId &&
          event.addToCartSendModel.sizeId == item.sizeId) {
        isExisting = true;
        break;
      } else {
        isExisting = false;
      }
    }
    if (!isExisting) {
      DemoData.cartItems.add(AddToCartSendModel(
        item: event.addToCartSendModel.item,
        sizeId: event.addToCartSendModel.sizeId,
        colorId: event.addToCartSendModel.colorId,
      ));
      log("the item of ID:${event.addToCartSendModel.item.id} is added to cart");
      emit(AddToCartState(isAddedItem: true, isAlreadyExiste: isExisting));
    }
  }

  FutureOr<void> _convertItemToFav(
      ConvertToFavoriteEvent event, Emitter<ProductScreenState> emit) {
    log("Befor Update ${event.itme.isFavorite}");
    event.itme.isFavorite = !event.itme.isFavorite;
    log("after Update ${event.itme.isFavorite}");
    emit(ConvetToFavoritetState(isFavorte: event.itme.isFavorite));
  }

  FutureOr<void> _choiceColor(
      ChoiceColorEvent event, Emitter<ProductScreenState> emit) {
    emit(ChoiceColorState(colorId: event.colorId));
  }

  FutureOr<void> _choiceSize(
      ChoiceSizeEvent event, Emitter<ProductScreenState> emit) {
    emit(ChoiceSizeState(sizeId: event.sizeId));
  }

  FutureOr<void> _loadedproductData(
      LoadedProductEvent event, Emitter<ProductScreenState> emit) async {
    bool isFound = false;
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));

    for (var item in DemoData.items) {
      if (item.id == event.itemId) {
        isFound = true;
        emit(LoadedProductSuccessfullyState(itemModel: item));
        log("the item is founded ");
        log(item.name);
      }
    }
    if (!isFound) {
      emit(ErrorState(errorMessage: "the item not found"));
    }
  }
}
