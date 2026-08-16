part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class SignUpClickedEvent extends SignUpEvent {
  final String email;
  final String password;

  SignUpClickedEvent({required this.email, required this.password});
}

final class NavigatorToLogInScreenEvent extends SignUpEvent {}
