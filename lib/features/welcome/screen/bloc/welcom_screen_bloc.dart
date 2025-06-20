import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcom_screen_event.dart';
part 'welcom_screen_state.dart';

class WelcomScreenBloc extends Bloc<WelcomScreenEvent, WelcomScreenState> {
  WelcomScreenBloc() : super(WelcomScreenInitial()) {
    on<WelcomScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
