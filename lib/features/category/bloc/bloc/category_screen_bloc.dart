import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dress_store/demo_data.dart';
import 'package:dress_store/models/item_model.dart';
import 'package:meta/meta.dart';

part 'category_screen_event.dart';
part 'category_screen_state.dart';

class CategoryScreenBloc
    extends Bloc<CategoryScreenEvent, CategoryScreenState> {
  CategoryScreenBloc() : super(CategoryInitial()) {
    on<LoadedCategoryScreenDataSuccessfullyEvent>(_loadedItems);
    on<AddToFavoriteEvent>(_addItemToFav);
    on<OPenProductScreenEvent>(_openProductScreen);
  }

  FutureOr<void> _openProductScreen(
      OPenProductScreenEvent event, Emitter<CategoryScreenState> emit) {
    emit(OpenProductScreenState(itemId: event.itemId));
    log("the item id is ${event.itemId}");
    log("open doneeeeeeee");
  }

  FutureOr<void> _addItemToFav(
      AddToFavoriteEvent event, Emitter<CategoryScreenState> emit) {
    log("Before ${event.item.isFavorite}");
    event.item.isFavorite = !event.item.isFavorite;
    log("After ${event.item.isFavorite}");

    emit(ConvertItemToFavoriteState());
  }

  List<ItemModel> items = [];

  FutureOr<void> _loadedItems(LoadedCategoryScreenDataSuccessfullyEvent event,
      Emitter<CategoryScreenState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      for (var item in DemoData.items) {
        if (item.categoryId == event.id) {
          items.add(item);
          log(item.categoryId.toString());
        }
      }
    } on Exception catch (e) {
      log(e.toString());
      emit(ErrorState(errorMessage: e.toString()));
    }
    emit(LoadedCategoryScreenDataSuccessfullyState(items: items));
  }
}
