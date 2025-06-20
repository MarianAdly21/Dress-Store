import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcom_screen_event.dart';
part 'welcom_screen_state.dart';

class WelcomScreenBloc extends Bloc<WelcomScreenEvent, WelcomScreenState> {
  WelcomScreenBloc() : super(WelcomScreenInitial()) {
    on<NavigateToLoginScreenEvent>(_openLoginScreen);
    on<NavigateToSignUpScreenEvent>(_openSignUpScreen);
  }

  FutureOr<void> _openSignUpScreen(
      NavigateToSignUpScreenEvent event, Emitter<WelcomScreenState> emit) {
    emit(NavigateToSignUpScreenState());
  }

  FutureOr<void> _openLoginScreen(
      NavigateToLoginScreenEvent event, Emitter<WelcomScreenState> emit) {
    emit(NavigateToLoginScreenState());
  }
}
