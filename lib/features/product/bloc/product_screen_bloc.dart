import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dress_store/demo_data.dart';
import 'package:dress_store/features/Home/models/item_model.dart';
import 'package:meta/meta.dart';

part 'product_screen_event.dart';
part 'product_screen_state.dart';

class ProductScreenBloc extends Bloc<ProductScreenEvent, ProductScreenState> {
  ProductScreenBloc() : super(ProductScreenInitial()) {
    on<LoadedProductEvent>(_loadedproductData);
    on<ChoiceSizeEvent>(_choiceSize);
    on<ChoiceColorEvent>(_choiceColor);
    on<ConvertToFavoriteEvent>(_convertItemToFav);
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
