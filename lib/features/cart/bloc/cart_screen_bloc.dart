import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dress_store/demo_data.dart';
import 'package:dress_store/models/add_to_cart_send_model.dart';
import 'package:dress_store/models/item_model.dart';
import 'package:meta/meta.dart';

part 'cart_screen_event.dart';
part 'cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(CartScreenInitial()) {
    on<LoadedItemsToCartEvent>(_cartItems);
    on<DeleteItemEvent>(_deleteItemFromCart);
    on<IncreaseItemEvent>(_increaseItem);
    on<DecreaseItemEvent>(_decreaseItem);
  }

  FutureOr<void> _decreaseItem(
      DecreaseItemEvent event, Emitter<CartScreenState> emit) {
    for (var element in DemoData.cartItems) {
      if (event.item.id == element.item.id) {
        if (element.quantity > 1) {
          element.quantity--;
        }
        break;
      }
    }
    emit(DecreaseItemState());
  }

  FutureOr<void> _increaseItem(
      IncreaseItemEvent event, Emitter<CartScreenState> emit) {
    for (var element in DemoData.cartItems) {
      if (event.item.id == element.item.id) {
        element.quantity++;
        break;
      }
    }
    emit(IncreaseItemState());
  }

  FutureOr<void> _deleteItemFromCart(
      DeleteItemEvent event, Emitter<CartScreenState> emit) {
   
    DemoData.cartItems
        .removeWhere((element) => event.itemId == element.item.id);

    log("the item is removed ${event.itemId} -------- ");
    for (var element in DemoData.cartItems) {
      log("${element.item.id}");
    }

    emit(DeleteItemState());
  }

  FutureOr<void> _cartItems(
      LoadedItemsToCartEvent event, Emitter<CartScreenState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(LoadedItemsToCartState(cartItems: DemoData.cartItems));
  }
}
