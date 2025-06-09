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
    bool isColorExisting = false;
    bool isSizerExisting = false;
    for (var item in DemoData.cartItems) {
      for (int i = 0; i < item.item.colors.length; i++) {
        if (item.item.id == event.addToCartSendModel.item.id &&
            event.addToCartSendModel.colorId == item.item.colors[i].id) {
          isColorExisting = true;
          break;
        }
      }

      for (int i = 0; i < item.item.sizes.length; i++) {
        if (item.item.id == event.addToCartSendModel.item.id &&
            event.addToCartSendModel.sizeId == item.item.sizes[i].id) {
          isSizerExisting = true;
          break;
        }
      }
      if (isSizerExisting && isColorExisting) {
        break;
      }
    }
    if (isSizerExisting && isColorExisting) {
      log(event.addToCartSendModel.quantity.toString());
      for (var e in DemoData.cartItems) {
        if (e.item.id == event.addToCartSendModel.item.id &&
            e.colorId == event.addToCartSendModel.colorId &&
            e.sizeId == event.addToCartSendModel.sizeId) {
          e.quantity++;
          emit(AddToCartState(isAddedItem: true, isAlreadyExiste: isExisting));
          break;
        }
      }
      log(event.addToCartSendModel.quantity.toString());
    }

    if (!isSizerExisting || !isColorExisting) {
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
