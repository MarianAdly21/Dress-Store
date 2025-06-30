part of 'login_screen_bloc.dart';

@immutable
sealed class LoginScreenState {}

final class LoginScreenInitial extends LoginScreenState {}

class ErrorState extends LoginScreenState {
 final String errorMessage;

  ErrorState({required this.errorMessage});
}

class LoadedState extends LoginScreenState {
  
}

class LoginSuccessfllyState extends LoginScreenState {}

class OpenSignUpState extends LoginScreenState {}

class LoginWithGoogleState extends LoginScreenState {}
