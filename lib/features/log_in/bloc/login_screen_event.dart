part of 'login_screen_bloc.dart';

@immutable
sealed class LoginScreenEvent {}

class ButtonLoginEvent extends LoginScreenEvent {
  final String email;
  final String password;

  ButtonLoginEvent({required this.email,required  this.password});
}

class OpenSignUpScreenEvent extends LoginScreenEvent {}

class LoginWithGoogleEvent extends LoginScreenEvent {}
