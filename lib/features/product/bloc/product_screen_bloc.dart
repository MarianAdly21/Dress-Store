import 'package:bloc/bloc.dart';
import 'package:dress_store/features/Home/models/item_model.dart';
import 'package:meta/meta.dart';

part 'product_screen_event.dart';
part 'product_screen_state.dart';

class ProductScreenBloc extends Bloc<ProductScreenEvent, ProductScreenState> {
  ProductScreenBloc() : super(ProductScreenInitial()) {
    on<ProductScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
