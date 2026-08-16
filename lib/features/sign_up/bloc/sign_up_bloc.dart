import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<NavigatorToLogInScreenEvent>(_navigatorToLogInScreenEvent);
    on<SignUpClickedEvent>(_signUpClickedEvent);
  }
  FutureOr<void> _signUpClickedEvent(
      SignUpClickedEvent event, Emitter<SignUpState> emit) async {
    emit(LoadingSignUpState());
    await Future.delayed(const Duration(seconds: 1));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(SuccessuflySignUpState());
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        emit(ErrorSignUpState(
            errorMessage: "'The password provided is too weak.'"));
      } else if (e.code == 'email-already-in-use') {
        emit(ErrorSignUpState(
            errorMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(ErrorSignUpState(errorMessage: e.toString()));
    }
  }
}

FutureOr<void> _navigatorToLogInScreenEvent(
    NavigatorToLogInScreenEvent event, Emitter<SignUpState> emit) {
  emit(NavigatorToLogInScreenState());
}
