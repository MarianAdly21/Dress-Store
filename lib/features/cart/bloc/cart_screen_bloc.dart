import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dress_store/demo_data.dart';
import 'package:dress_store/models/add_to_cart_send_model.dart';
import 'package:meta/meta.dart';

part 'cart_screen_event.dart';
part 'cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(CartScreenInitial()) {
    on<LoadedItemsToCartEvent>(_cartItems);
    on<DeleteItemEvent>(_deleteItemFromCart);
  }

  FutureOr<void> _deleteItemFromCart(
      DeleteItemEvent event, Emitter<CartScreenState> emit) {
    // for (var element in DemoData.cartItems)
    // {
    //   if(event.itemId==element.item.id)
    //   {
    //     DemoData.cartItems.removeWhere((element) => false)

    //   }

    // }
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
