import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dress_store/demo_data.dart';
import 'package:dress_store/models/add_to_cart_send_model.dart';
import 'package:meta/meta.dart';

part 'cart_screen_event.dart';
part 'cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(CartScreenInitial()) {
    on<LoadedItemsToCartEvent>(_cartItems);
  }

  FutureOr<void> _cartItems(
      LoadedItemsToCartEvent event, Emitter<CartScreenState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(LoadedItemsToCartState(cartItems: DemoData.cartItems));
  }
}
