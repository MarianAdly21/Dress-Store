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
  }

  List<ItemModel> items = [];

  FutureOr<void> _loadedItems(LoadedCategoryScreenDataSuccessfullyEvent event,
      Emitter<CategoryScreenState> emit) {
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
