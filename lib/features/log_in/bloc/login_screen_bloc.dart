import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenInitial()) {
    on<ButtonLoginEvent>(_loginToAccount);
    on<OpenSignUpScreenEvent>(_openSignScreen);
  }

  FutureOr<void> _openSignScreen(
      OpenSignUpScreenEvent event, Emitter<LoginScreenState> emit) {
    log("open sign up Screeeeeeeen");
    emit(OpenSignUpScreenState());
  }

  FutureOr<void> _loginToAccount(
      ButtonLoginEvent event, Emitter<LoginScreenState> emit) async {
    log("loginToAccount Called");
    emit(LoadedState());
    await Future.delayed(const Duration(seconds: 1));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(LoginSuccessfllyState());
    } on FirebaseAuthException catch (ex) {
      // if (ex.code == 'user-not-found') {
      //   emit(ErrorState(errorMessage: "No user found for that email"));
      // } else if (ex.code == 'wrong-password') {
      //   emit(ErrorState(errorMessage: "Wrong password provided for that user"));
      // }
      if (ex.code == 'invalid-credential') {
        emit(ErrorState(errorMessage: "Invalid email or password."));
      } else {
        log("Unknown FirebaseAuth error: ${ex.code}");
        emit(ErrorState(errorMessage: ex.message ?? "Erorr"));
      }
    } catch (e, st) {
      log("General error: $e");
      log("Stack trace: $st");
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
