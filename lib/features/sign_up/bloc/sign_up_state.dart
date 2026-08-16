part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class ErrorSignUpState extends SignUpState {
  final String errorMessage;

  ErrorSignUpState({required this.errorMessage});
}

final class LoadingSignUpState extends SignUpState {}

final class SuccessuflySignUpState extends SignUpState {}

final class NavigatorToLogInScreenState extends SignUpState {}
